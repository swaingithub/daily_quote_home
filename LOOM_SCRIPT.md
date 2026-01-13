# Loom Presentation Script: Daily Quote Home

**Goal:** ~5 Minute technical walkthrough for interviewers.
**Theme:** Clean Architecture, State Management (Provider), and Premium UI.

---

## Step 1: Introduction (The "Hook")
**Visual:** App running (Splash -> Onboarding)
**Time:** 0:00 - 0:45

"Hi, I'm [Your Name], and this is **Daily Quote Home**. 

It's a Flutter application I built to deliver daily inspiration. 

**I personally designed the UI in Stitch first**, creating detailed screens for both Light and Dark themes, and then implemented them into pixel-perfect Flutter code.

Technical highlights for this project include:
- **Feature-first Architecture** for scalability.
- **Provider** for efficient state management.
- A fully **Dynamic Theming System** that persists user preferences."

---

## Step 2: User Experience (Onboarding)
**Visual:** Swipe through Onboarding Screens -> Login
**Time:** 0:45 - 2:00

"I paid special attention to the first-time user experience. 
- You'll see custom widgets here, like this 'Sunrise' graphic, which I built using Flutter's native container styling rather than static images to ensure it renders perfectly on all screen sizes.
- Typography is key. I'm using `DM Serif Display` for the quotes to give them a classic, editorial feel, paired with `Outfit` for a modern UI readability.
- The flow naturally guides the user into the authentication & home experience."

---

## Step 3: Architecture Deep Dive
**Visual:** Switch to VS Code/IDE. Show `lib/` folder structure.
**Time:** 2:00 - 3:00

"Moving to the code, I structured the project by feature.
- **`core/`**: Holds shared resources like my AppTheme and Constants.
- **`features/`**: Separates modules like `auth`, `quote`, `collection`, and `onboarding`.

This separation of concerns allows the app to scale. For example, the **Home Screen** logic is completely decoupled from **Authentication**, making it easier to test and maintain."

*(Optional: Briefly open `home_screen.dart` to show clean widget tree)*

---

## Step 4: Theming System (Engineering Highlight)
**Visual:** App Settings Screen (Toggle Light/Dark) -> Code `theme_provider.dart`
**Time:** 3:00 - 4:30

"One engineering detail I'm proud of is the theme management. 
- In `Settings`, users can toggle between System, Light, and Dark modes.
- This isn't just a `setState` call; it uses a `ThemeProvider` that persists the choice to `SharedPreferences`.
- In `app_theme.dart`, I defined custom palettes. Instead of harsh black and white, I used **Cream (`#FDFCF5`)** and **Deep Charcoal (`#121212`)** to reduce eye strain and upgrade the visual quality."

---

## Step 5: Core Features & UI
**Visual:** Home Tabs (Collections / Favorites)
**Time:** 4:30 - ending

"Back in the UI, the Home screen uses a custom Bottom Navigation Bar for a cleaner look than the standard material widget. 
- The layout uses flexible widgets like `Spacer()` to adapt gracefully to different device heights.
- Future work includes connecting the 'Collections' feature to a backend to sync user favorites across devices."

"Thanks for watching!"
