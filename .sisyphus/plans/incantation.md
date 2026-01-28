# Incantation — AI-Reactive Music for Emacs

Status: active
Issues: #8, #9, #10, #11, #12

## Name

**Incantation** — the sourceror's code becomes sound. Every keystroke is a syllable in an ever-evolving spell. The cave hums back.

### Naming Glossary

| Component | Name | Role |
|-----------|------|------|
| Emacs package | `incantation.el` | Frontend — state capture, socket client, minor mode |
| Python server | `grimoire` | Backend — interprets state, drives music |
| State capture | `attunement` | O(1) hook that reads editor state |
| Music params | `sigils` | State→music parameter mappings |
| MIDI backend | `cantrip` | Phase A — simple local synthesis via fluidsynth |
| AI backend | `conjuration` | Phase C — Lyria RealTime API cloud generation |
| Prompt blend | `weaving` | Crossfading between musical ideas |
| Smoothing | `resonance` | Hysteresis, rolling averages, musical quantization |
| Mode lighter | ` 🜏` | Alchemical symbol for fire (modeline indicator) |

## Architecture

```
┌─────────────────────────────────────────────────────┐
│ EMACS — incantation.el                              │
│                                                     │
│  post-command-hook (O(1))                           │
│    └→ update attunement variables                   │
│                                                     │
│  run-with-timer (500ms)                             │
│    └→ build sigils JSON                             │
│    └→ write to Unix socket                          │
│                                                     │
│  incantation-mode (minor mode, lighter: 🜏)         │
│    └→ M-x incantation-mode                          │
│    └→ M-x incantation-connect                       │
│    └→ M-x incantation-silence (mute)                │
│    └→ M-x incantation-shift-mood (manual override)  │
└──────────────────────┬──────────────────────────────┘
                       │ Unix socket (/tmp/incantation.sock)
                       │ JSON messages, 2 msgs/sec max
                       ▼
┌─────────────────────────────────────────────────────┐
│ PYTHON — grimoire                                   │
│                                                     │
│  asyncio Unix socket server                         │
│    └→ receive sigils                                │
│    └→ apply resonance (smoothing)                   │
│    └→ route to active backend                       │
│                                                     │
│  ┌─────────────────┐  ┌──────────────────────────┐  │
│  │ cantrip (MIDI)  │  │ conjuration (Lyria RT)   │  │
│  │ fluidsynth      │  │ WebSocket → cloud        │  │
│  │ local, instant  │  │ 2s latency, AI-generated │  │
│  │ Phase A         │  │ Phase C                  │  │
│  └─────────────────┘  └──────────────────────────┘  │
│                                                     │
│  Audio output → CoreAudio (macOS)                   │
└─────────────────────────────────────────────────────┘
```

## Sigils — Editor State → Music Parameters

### Core Mappings

| Sigil | Source | Music Parameter | Range |
|-------|--------|-----------------|-------|
| `tempo` | Typing speed (chars/sec) | BPM | 60-180 |
| `altitude` | Cursor position (% of file) | Pitch center | Low → High |
| `depth` | Bracket/indent nesting | Harmonic complexity | 1-8 layers |
| `density` | Text length (lines) | Arrangement density | 0.0-1.0 |
| `pulse` | Keystroke rhythm variance | Rhythmic pattern | Steady → Chaotic |
| `essence` | Major mode | Genre/instrument | Mode-specific |
| `tension` | Flycheck error count | Dissonance | 0.0-1.0 |
| `flow` | Sustained typing (seconds) | Intensity curve | Builds over time |

### Essence (Mode → Genre) Mapping

| Major Mode | Musical Essence | Prompt Fragment |
|------------|----------------|-----------------|
| `clojure-mode` | Ambient electronic | `"ambient electronic with soft synth pads"` |
| `emacs-lisp-mode` | Chiptune/retro | `"8-bit chiptune with arpeggios"` |
| `python-mode` | Lo-fi hip hop | `"lo-fi hip hop with piano and vinyl crackle"` |
| `rust-mode` | Industrial | `"industrial electronic with heavy bass"` |
| `org-mode` | Classical piano | `"solo piano, contemplative, minimalist"` |
| `magit-mode` | Minimal techno | `"minimal techno, sparse, mechanical"` |
| `markdown-mode` | Acoustic ambient | `"acoustic guitar ambient, gentle"` |
| `*scratch*` | Drone | `"deep drone, evolving textures"` |
| `dired-mode` | Percussion | `"rhythmic percussion, tribal"` |
| default | Synthwave | `"synthwave, warm, nostalgic"` |

### Context Modifiers

| Context | Modifier | Effect |
|---------|----------|--------|
| CIDER debug active | `"tense, suspenseful"` | Adds tension |
| Test file (`*_test.*`) | `"focused, rhythmic, driving"` | Adds drive |
| Flycheck errors > 3 | `"dissonant, unsettling"` | Adds dissonance |
| Region active | `"staccato, precise"` | Adds precision |
| Minibuffer active | `"quiet, sparse"` | Reduces density |
| Idle > 30s | `"ambient, minimal, fading"` | Fades down |
| Sustained typing > 60s | `"building, hypnotic, flow state"` | Builds energy |

## Resonance — Smoothing & Hysteresis

### Principles

1. **5-10 second rolling average** for all numeric sigils
2. **Quantize to musical boundaries** — changes apply on beat/bar boundaries, not mid-phrase
3. **Nudge, don't dictate** — base state is always pleasant ambient; sigils nudge the mood
4. **3-5 second response granularity** for style shifts
5. **Immediate micro-responses** only for volume/density (typing rhythm → volume)

### Implementation

```python
class Resonance:
    """Smoothing layer for sigils. Prevents jarring musical shifts."""

    def __init__(self, window_seconds=8.0, send_interval=0.5):
        self.window_size = int(window_seconds / send_interval)  # 16 samples
        self.history = deque(maxlen=self.window_size)

    def smooth(self, sigils: dict) -> dict:
        self.history.append(sigils)
        smoothed = {}
        for key in sigils:
            if isinstance(sigils[key], (int, float)):
                values = [s.get(key, 0) for s in self.history]
                smoothed[key] = sum(values) / len(values)
            else:
                # For string values (essence, context), use most recent
                smoothed[key] = sigils[key]
        return smoothed
```

## Phases

### Phase A — Cantrip (MIDI synthesis, local)

**Goal**: Keystrokes make sound. Prove reactivity.

**Stack**:
- `incantation.el` → Unix socket → `grimoire` → fluidsynth → CoreAudio
- Latency: ~12ms (effectively instant)
- No internet, no GPU, no AI

**What it sounds like**:
- Base: ambient pad drone from SoundFont
- Typing speed → note density and tempo
- Bracket depth → chord complexity
- Mode changes → instrument/preset changes
- Errors → dissonant notes

**Deliverables**:
1. `incantation.el` — minor mode, attunement hooks, socket client
2. `grimoire/` — Python asyncio server, sigil processing, fluidsynth output
3. SoundFont selection (ambient/electronic)
4. Working demo: code in Clojure, hear music change

### Phase B — Refined Sigils

**Goal**: Music feels natural, not annoying.

**Work**:
- Iterate on sigil mappings until the music "breathes" with coding
- Add resonance (smoothing, hysteresis)
- Add context modifiers (debug, tests, errors)
- Add `incantation-shift-mood` for manual override
- Musical quantization (changes on beats)

### Phase C — Conjuration (Lyria RealTime API)

**Goal**: AI-generated music responding to coding in real-time.

**Stack**:
- Same `incantation.el` frontend (no changes needed)
- `grimoire` routes sigils to Lyria WebSocket instead of fluidsynth
- Sigils → weighted text prompts + BPM/density/brightness params

**Lyria API details**:
- Model: `models/lyria-realtime-exp`
- SDK: `google-genai >= 1.52.0`
- Free during experimental phase
- 48kHz stereo PCM output
- 2-second chunks, 10-second context window
- Weighted prompt blending for crossfading
- Parametric: BPM (60-200), density (0-1), brightness (0-1), scale/key
- Session limit: 10 minutes (auto-restart)

**Prompt construction from sigils**:
```python
def sigils_to_prompts(self, sigils: dict) -> list[WeightedPrompt]:
    prompts = []
    # Base essence from major mode
    prompts.append(WeightedPrompt(
        text=MODE_ESSENCES.get(sigils['essence'], DEFAULT_ESSENCE),
        weight=2.0))
    # Context modifier
    if sigils.get('tension') > 0.5:
        prompts.append(WeightedPrompt(
            text="tense, dissonant, unsettling", weight=sigils['tension']))
    # Flow state
    if sigils.get('flow') > 60:
        prompts.append(WeightedPrompt(
            text="building, hypnotic, flow state", weight=1.5))
    return prompts
```

### Phase D — Local Magenta RT (Future)

If Apple Silicon support lands or GPU access available.
Not planned for now.

## File Structure

```
bit-mage-theme.el/
├── incantation/
│   ├── incantation.el          # Emacs package
│   ├── grimoire/
│   │   ├── __init__.py
│   │   ├── server.py           # Unix socket asyncio server
│   │   ├── resonance.py        # Smoothing/hysteresis
│   │   ├── sigils.py           # State→music param mapping
│   │   ├── cantrip.py          # Phase A: fluidsynth MIDI backend
│   │   ├── conjuration.py      # Phase C: Lyria RealTime backend
│   │   └── requirements.txt
│   └── soundfonts/
│       └── .gitkeep            # User downloads their own
├── modules/
│   └── private/
│       └── live-coding/        # (existing)
└── bit-mage-theme.el           # (existing)
```

## Dependencies

### Emacs
- Emacs 28.1+ (Unix socket support via `make-network-process`)
- No external packages needed

### Python (Phase A — Cantrip)
```
pyfluidsynth>=1.3.0
```

### Python (Phase C — Conjuration)
```
google-genai>=1.52.0
```

### System (macOS)
```sh
brew install fluid-synth    # Phase A
pip install pyfluidsynth    # Phase A
export DYLD_FALLBACK_LIBRARY_PATH=/opt/homebrew/lib  # if needed
```

## Prior Art

| Project | Approach | Difference from Incantation |
|---------|----------|----------------------------|
| Overtone + Emacs Live | Write code TO make music | We make music FROM writing code |
| Sonic Pi | Dedicated music IDE | We augment an existing editor |
| R2 (macOS) | Keystroke → MIDI notes | We map semantic editor state, not raw keys |
| Rhythm of Code | Parse syntax → music | We use runtime state, not AST |
| Listen to Wikipedia | Edits → sound | Inspiration, but for wiki not code |

The key distinction: **Incantation doesn't make you write music code.** It listens to your normal coding and conjures an ambient soundtrack that breathes with your work.
