
CREATE TABLE UserRoles (
    RoleID INT PRIMARY KEY IDENTITY(1,1),
    RoleName NVARCHAR(50) NOT NULL UNIQUE,
    RoleDescription NVARCHAR(200) NULL
);

CREATE TABLE OrderStatuses (
    StatusID INT PRIMARY KEY IDENTITY(1,1),
    StatusName NVARCHAR(50) NOT NULL UNIQUE,
    StatusDescription NVARCHAR(200) NULL
);

CREATE TABLE ProductCategories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(100) NOT NULL UNIQUE,
    CategoryDescription NVARCHAR(500) NULL
);

CREATE TABLE Manufacturers (
    ManufacturerID INT PRIMARY KEY IDENTITY(1,1),
    ManufacturerName NVARCHAR(200) NOT NULL UNIQUE,
    ContactInfo NVARCHAR(500) NULL,
    Address NVARCHAR(500) NULL,
    Phone NVARCHAR(50) NULL
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY IDENTITY(1,1),
    SupplierName NVARCHAR(200) NOT NULL UNIQUE,
    ContactPerson NVARCHAR(100) NULL,
    Phone NVARCHAR(50) NULL,
    Email NVARCHAR(100) NULL,
    Address NVARCHAR(500) NULL
);

CREATE TABLE UnitsOfMeasure (
    UnitID INT PRIMARY KEY IDENTITY(1,1),
    UnitName NVARCHAR(50) NOT NULL UNIQUE,
    UnitShortName NVARCHAR(10) NOT NULL
);

CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Login NVARCHAR(50) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(255) NOT NULL,
    FullName NVARCHAR(200) NOT NULL,
    RoleID INT NOT NULL,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    LastLogin DATETIME NULL,
    CONSTRAINT FK_Users_Role FOREIGN KEY (RoleID) REFERENCES UserRoles(RoleID)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(200) NOT NULL,
    CategoryID INT NOT NULL,
    Description NVARCHAR(MAX) NULL,
    ManufacturerID INT NOT NULL,
    SupplierID INT NOT NULL,
    Price DECIMAL(18, 2) NOT NULL CHECK (Price >= 0),
    UnitID INT NOT NULL,
    QuantityInStock INT NOT NULL DEFAULT 0 CHECK (QuantityInStock >= 0),
    DiscountPercentage DECIMAL(5, 2) NOT NULL DEFAULT 0 CHECK (DiscountPercentage >= 0 AND DiscountPercentage <= 100),
    ImagePath NVARCHAR(500) NULL DEFAULT 'picture.png',
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Products_Category FOREIGN KEY (CategoryID) REFERENCES ProductCategories(CategoryID),
    CONSTRAINT FK_Products_Manufacturer FOREIGN KEY (ManufacturerID) REFERENCES Manufacturers(ManufacturerID),
    CONSTRAINT FK_Products_Supplier FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    CONSTRAINT FK_Products_Unit FOREIGN KEY (UnitID) REFERENCES UnitsOfMeasure(UnitID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    OrderNumber NVARCHAR(50) NOT NULL UNIQUE,
    UserID INT NOT NULL,
    StatusID INT NOT NULL,
    OrderDate DATETIME NOT NULL DEFAULT GETDATE(),
    IssueDate DATETIME NOT NULL,
    PickupPointAddress NVARCHAR(500) NOT NULL,
    TotalAmount DECIMAL(18, 2) NOT NULL DEFAULT 0 CHECK (TotalAmount >= 0),
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Orders_User FOREIGN KEY (UserID) REFERENCES Users(UserID),
    CONSTRAINT FK_Orders_Status FOREIGN KEY (StatusID) REFERENCES OrderStatuses(StatusID)
);

CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    PriceAtOrder DECIMAL(18, 2) NOT NULL CHECK (PriceAtOrder >= 0),
    DiscountAtOrder DECIMAL(5, 2) NOT NULL DEFAULT 0 CHECK (DiscountAtOrder >= 0 AND DiscountAtOrder <= 100),
    CONSTRAINT FK_OrderItems_Order FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    CONSTRAINT FK_OrderItems_Product FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
