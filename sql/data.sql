INSERT INTO user (
    userAccount, 
    userPassword, 
    username, 
    avatarUrl, 
    gender, 
    phone, 
    email, 
    userStatus, 
    isDelete, 
    userRole, 
    planetCode
) VALUES 
    ('user001', '123456', '小明', 'https://example.com/avatar1.jpg', 0, '13800138001', 'xiaoming@example.com', 0, 0, 0, 'EARTH001'),
    ('user002', 'abcdef', '小红', 'https://example.com/avatar2.jpg', 1, '13800138002', 'xiaohong@example.com', 0, 0, 0, 'MARS001'),
    ('user003', 'qwerty', '管理员A', 'https://example.com/avatar3.jpg', 0, '13800138003', 'adminA@example.com', 0, 0, 1, 'ADMIN001'),
    ('user004', 'pass1234', '测试用户', NULL, NULL, '13800138004', 'test@example.com', 0, 0, 0, 'TEST001'),
    ('user005', '888888', '访客', 'https://example.com/avatar5.jpg', 0, NULL, 'visitor@example.com', 0, 0, 0, NULL);