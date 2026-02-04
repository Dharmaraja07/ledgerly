# Ledgerly: Industry-Level Feature Implementation Plan

## Overview
This document outlines the architecture and step-by-step roadmap to elevate Ledgerly to an industry-standard financial application. The focus is on **Security**, **Financial Intelligence**, **Visual Analytics**, and **User Engagement**.

## Architecture Strategy
We will continue following the **Feature-First Clean Architecture** already present in the codebase (`features/domain`, `features/data`, `features/presentation`).

### Global Modules (Core)
- **Security Module**: Biometric authentication and secure storage wrappers.
- **Analytics Engine**: Centralized aggregation of transaction data for charts.
- **Notification Manager**: Local notification channels for reminders and alerts.

---

## 🚀 Phase 1: Security & Trust (The "Vault" Feel)
*Objective: Build trust by securing sensitive financial data.*

### 1.1 Biometric Authentication
- **Feature**: Fingerprint/FaceID login on app startup.
- **Architecture**:
    - `SecurityService` (Interface) -> `BiometricLocalAuth` (Impl using `local_auth`).
    - `AuthBloc`: Listen to app lifecycle state to lock app when backgrounded.
- **Dependencies**: `local_auth`.

### 1.2 Privacy Screen
- **Feature**: Blur app content in multitasking view (iOS/Android).
- **Implementation**: Native channel configuration or widget overlay when `AppLifecycleState` is paused.

---

## 📊 Phase 2: Visual Analytics (The "WOW" Factor)
*Objective: Provide actionable insights through rich visualizations.*

### 2.1 Dashboard Charts
- **Feature**: Monthly spending trend (Bar Chart) and Category Breakdown (Pie Chart).
- **Architecture**:
    - **Feature Module**: `features/analytics`
    - **Domain**: `GetSpendingBreakdownUseCase`
    - **UI**: `SpendingChartWidget` using `fl_chart`.
- **Dependencies**: `fl_chart`.

---

## 💰 Phase 3: Budgeting System (Core Utility)
*Objective: Help users save money, not just track it.*

### 3.1 Budget Creation
- **Feature**: Set monthly limits per category.
- **Architecture**:
    - **Entity**: `Budget` (Isar Collection).
    - **Logic**: `BudgetBloc` to calculate `spent` vs `limit`.
- **Visuals**: Progress bars on the main list with color coding (Green > Yellow > Red).

---

## 📤 Phase 4: Data Sovereignty (Pro Features)
*Objective: Give users ownership of their data.*

### 4.1 Export & Reporting
- **Feature**: Generate CSV/PDF reports for tax purposes.
- **Architecture**:
    - `ExportService`: Mappers to convert `Transaction` entities to CSV row strings.
    - `FileService`: Save to device documents.
- **Dependencies**: `csv`, `pdf`, `share_plus`.

---

## 🔔 Phase 5: Engagement (Smart Alerts)
*Objective: Keep users returning.*

### 5.1 Smart Reminders
- **Feature**: "Daily Log" reminder at 8 PM, "Budget Exceeded" alerts.
- **Architecture**:
    - `NotificationService`: Wrapper around `flutter_local_notifications`.
    - Trigger logic in `ExpenseBloc` (e.g., if total > budget, trigger notification).

---

## Implementation Checklist & Status

- [ ] **Step 1**: Install Dependencies (`local_auth`, `fl_chart`, `csv`, etc.)
- [ ] **Step 2**: Implement `BiometricService` (Core Security)
- [x] **Step 3**: Create `Analytics` Feature Structure
- [x] **Step 4**: Implement `SpendingChartWidget`
- [x] **Step 5**: Create `Budget` Isar Collection & Repository
- [x] **Phase 5**: Smart Reminders & Budget Alerts
- [x] **Step 6**: Implement Export Component
