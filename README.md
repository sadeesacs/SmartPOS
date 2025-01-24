# 🏬 SmartPOS - Streamlined Point of Sale Solution

SmartPOS is a comprehensive and efficient POS system designed to enhance supermarket operations, improve customer experiences, and provide insightful data for decision-making. This solution integrates customer management, inventory tracking, sales operations, and reporting functionalities with a focus on user-friendly interfaces and seamless workflows.

---

## Features and Functionalities

### Welcome Webpage
- Introduces users to the system with branding and a clear welcome message.
- Provides a login button for role-based access.

### Login Webpage
- Secure login with username and password.
- Role-based access redirects users to specific pages:
  - Admin: Dashboard.
  - Manager: Dashboard.
  - Cashier: POS webpage.

### Dashboard
- Displays daily store statistics:
  - Total items sold, customers served, and sales revenue.
  - Critical stock alerts.
- Visual data representation:
  - Line charts for sales trends and pie charts for income categorization.

### Point of Sale (POS)
- Facilitates quick and accurate sales transactions.
- Features dynamic calculations for totals, discounts, and net payable amounts.
- Generates detailed receipts and provides options for printing.

### Product Management
- Displays products with details like name, price, quantity, and image.
- Allows adding, editing, and deleting products.
- Categorizes products for easy browsing.

### Stock Management
- Displays stock details with categorization:
  - Critical stock, low stock, out-of-stock, and available stock.
- Provides options to add, edit, and delete stock entries.

### Discount Management
- Lists active discounts with product details.
- Allows adding and deleting discounts with ease.

### Bill Management
- Enables quick search and retrieval of past bills.
- Displays detailed bill information for easy dispute resolution.

### Customer Management
- Displays customer details and allows adding, editing, and deleting records.

### System User Management
- Manages users, roles, and credentials securely.
- Allows password updates and user role modifications.

### Reports
- Provides insightful data for decision-making:
  - Daily stock reports, monthly revenue reports, top-performing products, and low-performing products.
- Supports filtering for tailored reporting.

---

## Technologies Used
- **Frontend**: HTML, CSS, and JavaScript for responsive design and user-friendly interfaces.
- **Backend**: Java for robust business logic.
- **Database**: SQL Server for secure data storage and retrieval.

---

## Installation and Setup

### Prerequisites
- Microsoft SQL Server (2019 or later).
- Java runtime environment.

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/SmartPOS.git
   cd SmartPOS
   ```
2. Restore the database using the provided `.bak` file in SQL Server.
3. Update the database connection settings in `config`/`dbcon`.
4. Run the application using your preferred IDE or build tool.

---
