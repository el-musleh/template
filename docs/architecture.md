# Architecture

## Overview

{{PROJECT_DESCRIPTION}}

## Design Decisions

Document major architectural decisions in `docs/decisions/` using the ADR format.

## Modules

### `src/core/`
Core application logic and business rules.

### `src/utils/`
Shared utilities used across modules.

## Data Flow

```
[Input] -> src/core/ -> [Output]
            |
            v
        src/utils/
```

## Technology Stack

{{TECH_STACK}}
