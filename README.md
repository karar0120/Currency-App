
# currency_converter_app

A simple Flutter application to convert currencies and view conversion history.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Project Structure](#project-structure)
- [Architecture](#architecture)
- [Branches](#branches)
- [Screens](#screens)
- [API Integration](#api-integration)

## Introduction

- Welcome to the Currency Converter App!
- This Flutter application helps users convert currency amounts between different currencies using live exchange rates.
- Users can also view historical conversion data.

## Features

- Select "From" and "To" currencies from dropdown lists containing all supported currencies.
- Enter an amount (numbers only, default 1) and get the converted value instantly.
- Automatically update converted amount when input changes.
- Swap "From" and "To" currencies with a dedicated button.
- View historical exchange rates for the selected currency pair over the last 4 days.
- Conversion history screen to review past conversions.
- Clean architecture using Bloc pattern and Dio for API calls.
- Error handling with user-friendly messages.

## Getting Started

### Prerequisites

- Ensure you have Flutter and Dart installed.
- If not, follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install).

### Installation

- Clone the repository:

  ```bash
  git clone https://github.com/yourusername/currency_converter_app.git
  cd currency_converter_app
  ```

- Install dependencies:

  ```bash
  flutter pub get
  ```

- Run the app:

  ```bash
  flutter run
  ```

## Project Structure

- `core` - Common and core files
  - `error` - Exceptions and failure classes
  - `helper` - Utility and helper classes
  - `routing` - App navigation routes
  - `theme` - Theme and styles
  - `widgets` - Common reusable widgets
- `data` - Data layer
  - `datasources` - API and local data sources
  - `models` - Data models and JSON serialization
  - `repositories` - Repository implementations
- `domain` - Domain layer
  - `entities` - Core business entities
  - `repositories` - Abstract repository definitions
  - `usecases` - Use cases / business logic
- `presentation` - UI layer
  - `blocs` - Bloc state management
  - `pages` - Screens and pages
  - `widgets` - UI components/widgets

## Architecture

- Follows [Clean Architecture principles by Robert C. Martin](https://8thlight.com/blog/uncle-bob/2012/08/13/the-clean-architecture.html).
- Ensures maintainability and testability.

<img src="https://github.com/ResoCoder/flutter-tdd-clean-architecture-course/blob/master/architecture-proposal.png" style="display: block; margin-left: auto; margin-right: auto; width: 75%;" />

- Image Source: [ResoCoder](https://resocoder.com)

## Branches

- `master` - Latest stable release
- `dev` - Latest development branch
  - `feature/currency-conversion` - Feature branch for currency conversion
  - `feature/conversion-history` - Feature branch for history screen
  - `bugfix/*` - Bug fixes
  - `docs/*` - Documentation changes

## Screens

- **Currency Conversion Screen**
- ![Screenshot_1748100423](https://github.com/user-attachments/assets/09d97b2b-6da5-46f0-a062-02f86c8827a9)
  - Select currencies with dropdowns.
  - ![Screenshot_1748100426](https://github.com/user-attachments/assets/6c40d57a-7f69-4b65-a3de-5a18f836c9df)
![Screenshot_1748100429](https://github.com/user-attachments/assets/1728e2b5-24ff-4299-83b4-947beab23002)
  - Enter amount to convert.
  - ![Screenshot_1748100454](https://github.com/user-attachments/assets/b87ee7c7-4778-4926-8a60-10aab2e794cb)
  - Swap currencies button.
  - ![Screenshot_1748100467](https://github.com/user-attachments/assets/24415483-d502-4629-9aa8-977fb156f2b9)
  - Display conversion result instantly.
![Screenshot_1748100480](https://github.com/user-attachments/assets/9a670f5a-1763-44a4-964c-1265f54d31d2)

- **Conversion History Screen**
  - List of historical exchange rates for selected currency pairs.
  - ![Screenshot_1748100472](https://github.com/user-attachments/assets/576cba71-c0ac-461a-8d8b-3c3932955dda)

  - Data for last 4 days.

## API Integration

- Uses [Fixer API](https://fixer.io/) for live currency exchange rates and historical data.
- API calls made via Dio package.
- JSON serialization for data parsing.
- Handles API and connectivity errors gracefully.

---

