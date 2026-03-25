
INSERT INTO UserRoles (RoleName, RoleDescription) VALUES
('Гость', 'Неавторизованный пользователь с ограниченным доступом'),
('Авторизованный клиент', 'Зарегистрированный клиент с доступом к каталогу'),
('Менеджер', 'Менеджер магазина с доступом к просмотру заказов и фильтрации товаров'),
('Администратор', 'Полные права администратора системы');

INSERT INTO OrderStatuses (StatusName, StatusDescription) VALUES
('Новый', 'Заказ только создан, еще не обработан'),
('В обработке', 'Заказ обрабатывается'),
('Готов к выдаче', 'Заказ готов к выдаче в пункте выдачи'),
('Выполнен', 'Заказ получен клиентом'),
('Отменен', 'Заказ отменен');

INSERT INTO ProductCategories (CategoryName, CategoryDescription) VALUES
('Гробы', 'Деревянные и металлические гробы различных размеров и отделок'),
('Венки', 'Ритуальные венки и цветочные композиции'),
('Кресты', 'Мемориальные кресты из дерева и металла'),
('Памятники', 'Гранитные и мраморные памятники и надгробия'),
('Ритуальные принадлежности', 'Похоронные принадлежности и ритуальные предметы'),
('Урны', 'Урны для праха из различных материалов');

INSERT INTO Manufacturers (ManufacturerName, ContactInfo, Address, Phone) VALUES
('РитуалДрев Лтд', 'Деревянные изделия премиум-класса', 'Москва, ул. Индустриальная, д. 15', '+7 (495) 123-4567'),
('ГранитМастер', 'Производство памятников', 'Санкт-Петербург, ул. Каменная, д. 8', '+7 (812) 234-5678'),
('ВечнаяПамять', 'Металлические изделия и кресты', 'Екатеринбург, пр. Металлургов, д. 42', '+7 (343) 345-6789'),
('ЦветочныйДар', 'Цветочные композиции', 'Казань, ул. Цветочная, д. 3', '+7 (843) 456-7890'),
('КерамикаАрт', 'Керамические урны и аксессуары', 'Новосибирск, ул. Керамическая, д. 7', '+7 (383) 567-8901');

INSERT INTO Suppliers (SupplierName, ContactPerson, Phone, Email, Address) VALUES
('РитуальСнаб', 'Иван Петров', '+7 (495) 789-1234', 'ivan@ritualsupply.ru', 'Москва, ул. Торговая, д. 25'),
('ПохоронТовары', 'Мария Сидорова', '+7 (812) 890-2345', 'maria@funeralgoods.ru', 'Санкт-Петербург, Невский пр., д. 100'),
('МемориалМарт', 'Алексей Смирнов', '+7 (343) 901-3456', 'alexey@memorialmart.ru', 'Екатеринбург, ул. Ленина, д. 50'),
('ВечнаяЗабота', 'Елена Волкова', '+7 (843) 012-4567', 'elena@eternalcare.ru', 'Казань, ул. Пушкина, д. 15'),
('РитуалТрейд', 'Дмитрий Морозов', '+7 (383) 123-5678', 'dmitry@ritualtrade.ru', 'Новосибирск, Красный пр., д. 200');

INSERT INTO UnitsOfMeasure (UnitName, UnitShortName) VALUES
('Штука', 'шт'),
('Набор', 'наб'),
('Метр', 'м'),
('Килограмм', 'кг'),
('Литр', 'л');

INSERT INTO Users (Login, PasswordHash, FullName, RoleID, IsActive, CreatedAt, LastLogin) VALUES
('ivanov_admin', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Иванов Иван Иванович', 4, 1, GETDATE(), GETDATE()),
('petrov_manager', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Петров Петр Петрович', 3, 1, GETDATE(), GETDATE()),
('sidorova_client', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Сидорова Мария Ивановна', 2, 1, GETDATE(), GETDATE()),
('smirnov_client', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Смирнов Алексей Владимирович', 2, 1, GETDATE(), GETDATE()),
('volkov_manager', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Волкова Елена Дмитриевна', 3, 1, GETDATE(), GETDATE()),
('morozov_admin', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Морозов Дмитрий Алексеевич', 4, 0, GETDATE(), GETDATE()),
('kozlova_client', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Козлова Ольга Сергеевна', 2, 1, GETDATE(), GETDATE()),
('novikov_manager', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Новиков Андрей Викторович', 3, 1, GETDATE(), GETDATE());

INSERT INTO Products (ProductName, CategoryID, Description, ManufacturerID, SupplierID, Price, UnitID, QuantityInStock, DiscountPercentage, ImagePath, CreatedAt, UpdatedAt) VALUES
('Гроб классический деревянный', 1, 'Традиционный деревянный гроб из сосны, натуральная отделка', 1, 1, 15000.00, 1, 25, 10.00, 'coffin_classic.jpg', GETDATE(), GETDATE()),
('Гроб дубовый премиум', 1, 'Цельный дубовый гроб с велюровой обивкой, латунные ручки', 1, 2, 35000.00, 1, 8, 0.00, 'coffin_oak.jpg', GETDATE(), GETDATE()),
('Гроб металлический', 1, 'Металлический гроб с цинковым покрытием, подходит для кремации', 3, 3, 25000.00, 1, 12, 5.00, 'coffin_metal.jpg', GETDATE(), GETDATE()),
('Венок мемориальный', 2, 'Венок из живых цветов с еловыми ветвями и лентами', 4, 4, 3500.00, 1, 0, 0.00, 'wreath_memorial.jpg', GETDATE(), GETDATE()),
('Цветочная корзина', 2, 'Букет из свежих роз и лилий в корзине', 4, 4, 2800.00, 1, 15, 0.00, 'floral_basket.jpg', GETDATE(), GETDATE()),
('Венок из белых лилий', 2, 'Элегантный венок из белых лилий', 4, 5, 4200.00, 1, 7, 0.00, 'wreath_lilies.jpg', GETDATE(), GETDATE()),
('Крест деревянный резной', 3, 'Резной дубовый крест, высота 150 см', 1, 1, 4500.00, 1, 30, 20.00, 'cross_wooden.jpg', GETDATE(), GETDATE()),
('Крест металлический', 3, 'Металлический крест с золотым покрытием', 3, 3, 6800.00, 1, 18, 15.00, 'cross_metal.jpg', GETDATE(), GETDATE()),
('Памятник гранитный', 4, 'Памятник из черного гранита с местом для гравировки', 2, 2, 85000.00, 1, 5, 0.00, 'monument_granite.jpg', GETDATE(), GETDATE()),
('Надгробие мраморное', 4, 'Надгробие из белого мрамора с декоративными элементами', 2, 2, 120000.00, 1, 3, 0.00, 'tombstone_marble.jpg', GETDATE(), GETDATE()),
('Набор ритуальных свечей', 5, 'Набор из 6 ритуальных свечей в стеклянных подсвечниках', 5, 5, 850.00, 2, 45, 0.00, 'candles_set.jpg', GETDATE(), GETDATE()),
('Ленты траурные', 5, 'Черные траурные ленты, по 2 метра', 5, 5, 120.00, 3, 120, 0.00, 'ribbons.jpg', GETDATE(), GETDATE()),
('Молитвослов', 5, 'Православный молитвослов для отпевания', 5, 4, 350.00, 1, 0, 0.00, 'prayer_book.jpg', GETDATE(), GETDATE()),
('Урна керамическая', 6, 'Керамическая урна белого цвета с золотым узором', 5, 5, 5500.00, 1, 12, 0.00, 'urn_ceramic.jpg', GETDATE(), GETDATE()),
('Урна деревянная', 6, 'Деревянная урна ручной работы из дуба', 1, 1, 7800.00, 1, 8, 0.00, 'urn_wooden.jpg', GETDATE(), GETDATE()),
('Урна бронзовая', 6, 'Бронзовая урна премиум-класса с возможностью гравировки', 3, 3, 15000.00, 1, 4, 0.00, 'urn_bronze.jpg', GETDATE(), GETDATE()),
('Гроб эконом', 1, 'Простой сосновый гроб для бюджетных похорон', 1, 1, 8000.00, 1, 35, 25.00, 'coffin_economy.jpg', GETDATE(), GETDATE()),
('Плита гранитная мемориальная', 4, 'Компактная гранитная плита для мемориальной стены', 2, 2, 12500.00, 1, 0, 0.00, 'plaque_granite.jpg', GETDATE(), GETDATE()),
('Крест цветочный', 2, 'Цветочная композиция в форме креста', 4, 4, 4800.00, 1, 10, 5.00, 'floral_cross.jpg', GETDATE(), GETDATE()),
('Набор ритуальных полотенец', 5, 'Набор ритуальных полотенец, 3 штуки', 5, 5, 650.00, 2, 55, 10.00, 'towel_set.jpg', GETDATE(), GETDATE());

DECLARE @UserID1 INT, @UserID2 INT, @UserID3 INT, @UserID4 INT, @UserID5 INT, @UserID6 INT, @UserID7 INT, @UserID8 INT;

SELECT @UserID1 = UserID FROM Users WHERE Login = 'ivanov_admin';
SELECT @UserID2 = UserID FROM Users WHERE Login = 'petrov_manager';
SELECT @UserID3 = UserID FROM Users WHERE Login = 'sidorova_client';
SELECT @UserID4 = UserID FROM Users WHERE Login = 'smirnov_client';
SELECT @UserID5 = UserID FROM Users WHERE Login = 'volkov_manager';
SELECT @UserID6 = UserID FROM Users WHERE Login = 'morozov_admin';
SELECT @UserID7 = UserID FROM Users WHERE Login = 'kozlova_client';
SELECT @UserID8 = UserID FROM Users WHERE Login = 'novikov_manager';

INSERT INTO Orders (OrderNumber, UserID, StatusID, OrderDate, IssueDate, PickupPointAddress, TotalAmount, CreatedAt, UpdatedAt) VALUES
('ЗАК-2025-0001', @UserID3, 3, CONVERT(DATETIME, '2025-03-01 10:30:00', 120), CONVERT(DATETIME, '2025-03-05 14:00:00', 120), 'Москва, Ленинский пр-т, д. 10', 0.00, GETDATE(), GETDATE()),
('ЗАК-2025-0002', @UserID4, 2, CONVERT(DATETIME, '2025-03-05 09:15:00', 120), CONVERT(DATETIME, '2025-03-10 12:00:00', 120), 'Санкт-Петербург, Московский пр-т, д. 25', 0.00, GETDATE(), GETDATE()),
('ЗАК-2025-0003', @UserID3, 5, CONVERT(DATETIME, '2025-03-08 14:45:00', 120), CONVERT(DATETIME, '2025-03-12 10:00:00', 120), 'Москва, ул. Тверская, д. 5', 0.00, GETDATE(), GETDATE()),
('ЗАК-2025-0004', @UserID7, 1, CONVERT(DATETIME, '2025-03-12 11:00:00', 120), CONVERT(DATETIME, '2025-03-18 15:30:00', 120), 'Екатеринбург, ул. Малышева, д. 30', 0.00, GETDATE(), GETDATE()),
('ЗАК-2025-0005', @UserID4, 3, CONVERT(DATETIME, '2025-03-15 16:20:00', 120), CONVERT(DATETIME, '2025-03-20 13:00:00', 120), 'Казань, ул. Баумана, д. 15', 0.00, GETDATE(), GETDATE()),
('ЗАК-2025-0006', @UserID8, 2, CONVERT(DATETIME, '2025-03-18 08:30:00', 120), CONVERT(DATETIME, '2025-03-25 11:00:00', 120), 'Новосибирск, Красный пр-т, д. 150', 0.00, GETDATE(), GETDATE()),
('ЗАК-2025-0007', @UserID3, 4, CONVERT(DATETIME, '2025-03-20 13:45:00', 120), CONVERT(DATETIME, '2025-03-22 16:00:00', 120), 'Москва, ул. Арбат, д. 25', 0.00, GETDATE(), GETDATE()),
('ЗАК-2025-0008', @UserID7, 1, CONVERT(DATETIME, '2025-03-22 10:00:00', 120), CONVERT(DATETIME, '2025-03-28 14:30:00', 120), 'Екатеринбург, пр. Ленина, д. 50', 0.00, GETDATE(), GETDATE());
