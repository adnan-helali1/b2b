# B2B UI Rules (Source of Truth)

This file defines the mandatory UI rules for this project.
Any new screen or widget must follow these rules to keep one visual identity.

## 1) Theme and Typography
- Use project theme only. Do not create local theme variants per screen.
- Keep `useMaterial3: true` behavior.
- Main font family is Cairo.
- Text styles should come from shared styles first (for example `TextStyles`) and then be adjusted with `copyWith` only when needed.

## 2) Colors (Mandatory)
- Never hardcode UI colors for product surfaces, text, borders, badges, or states.
- Always read colors from theme:
  - `context.cs` for `ColorScheme` colors.
  - `context.appColors` for custom extension colors (`success`, `warning`, `info`, `cardBackground`, `borderColor`).
- Preferred order when choosing a color:
  1. Semantic from `context.appColors` (state/status meaning).
  2. Semantic from `context.cs` (primary/secondary/surface/error).
  3. Add a new color token in theme only if no existing token fits.
- Keep contrast accessible. Avoid low-contrast text on tinted cards.

## 3) Spacing and Layout Rhythm
- Keep vertical rhythm consistent using shared helpers (for example `verticalSpace(...)`).
- Use repeated spacing scale across screens: 8, 12, 16, 20, 24.
- Default page content padding is 16 unless a section explicitly needs a different value.
- Group related content in clear sections, separated by consistent vertical gaps.

## 4) Responsive Rules
- Use `flutter_screenutil` tokens for sizes (`.h`, `.w`, `.sp`, `.r`) where appropriate.
- Avoid fixed pixel sizes for typography and spacing in reusable widgets.
- Test layout behavior for small and large phones before finalizing.

## 5) Shared Components First
- Reuse shared UI components before creating new ones (app bar, cards, inputs, buttons, badges).
- If a new pattern appears in 2+ places, extract it into a shared widget.
- Do not duplicate near-identical widget trees across modules.

## 6) App Bars and Page Structure
- Use shared app bar component (`B2bAppBar`) when the screen follows the standard header pattern.
- Standard body structure should stay clean and predictable:
  - Scaffold
  - Page padding
  - Section-based Column/List content

## 7) State and Loading UX
- Use Bloc/Cubit for dynamic screens and data-driven views.
- Every asynchronous screen must define these states:
  - loading
  - success
  - empty
  - error
- Empty and error states should be visually aligned with theme and spacing rules.

## 8) Navigation Consistency
- Register and navigate through centralized router and route constants.
- Avoid inline route strings scattered across features.

## 9) Borders, Radius, and Elevation
- Keep border radius consistent (project default style, commonly around 12 to 16).
- Border colors should come from `context.appColors.borderColor` or `context.cs.outlineVariant` when suitable.
- Use subtle elevation; avoid heavy shadows that break the current style language.

## 10) Icons and Visual Density
- Keep icon sizes and text sizes balanced in action tiles and cards.
- Do not mix dense and sparse sections in the same screen without clear hierarchy.
- Preserve comfortable tap targets for interactive elements.

## 11) Code Quality for UI
- Keep build methods readable; split complex sections into private widgets.
- Avoid deep nesting when a dedicated widget improves clarity.
- Keep comments minimal and useful (only for non-obvious logic).

## 12) Feature Folder Structure
- Every new feature must follow the same split:
  - `ui/screens` for page-level composition and layout.
  - `ui/widgets` for reusable UI blocks used by one or more screens.
  - `logic` for Cubit/Bloc, state, and UI behavior.
  - `data` for models, fake data, and API-ready repositories.
- Do not mix large screen layouts with reusable widgets in the same folder.
- If a UI block is reused or likely to be reused, move it to `ui/widgets` immediately.
- Keep screen files thin; the screen should compose widgets, not own every visual detail.

## 13) Implementation Checklist (Before Marking UI Done)
- Colors come from `context.cs` or `context.appColors` only.
- Spacing follows shared rhythm and helpers.
- Typography follows Cairo and shared text styles.
- Responsive behavior checked with ScreenUtil sizing.
- Loading/empty/error states are implemented.
- No obvious visual drift from existing project screens.

## Team Note
These rules are mandatory unless a product decision explicitly approves an exception.
If a rule needs to change, update this file first, then implement UI changes.
