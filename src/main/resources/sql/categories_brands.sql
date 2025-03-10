-- Insert dữ liệu vào bảng categories
INSERT INTO categories (name, image, description)
VALUES ('Acoustic Drum Kits', 'acoustic-drum-kits-category.jpg', 'Bộ trống truyền thống với âm thanh tự nhiên.'),
       ('Electronic Drum Kits', 'electronic-drum-kits-category.jpg',
        'Bộ trống điện tử phù hợp cho luyện tập và biểu diễn trong nhà.'),
       ('Snare Drums', 'snare-drums-category.jpg',
        'Phần quan trọng trong bất kỳ bộ trống nào, thường dùng để tạo điểm nhấn.'),
       ('Bass Drums', 'bass-drums-category.jpg', 'Tạo âm trầm, thường được điều khiển bằng pedal chân.'),
       ('Cymbals', 'cymbals-category.jpg',
        'Bao gồm hi-hats, crash, ride và splash cymbals, tạo ra các âm thanh khác nhau.'),
       ('Percussion Instruments', 'percussion-instruments-category.jpg',
        'Bao gồm tambourines, bongos, congas và cowbells, bổ sung đa dạng cho bộ trống.');

-- Insert dữ liệu vào bảng brands
INSERT INTO brands (name, image, description)
VALUES ('Yamaha', 'yamaha-brand.jpg', 'Nổi tiếng với chất lượng âm thanh và độ bền.'),
       ('Pearl', 'pearl-brand.jpg', 'Được đánh giá cao bởi các bộ trống chuyên nghiệp và thiết kế sáng tạo.'),
       ('Tama', 'tama-brand.jpg', 'Ưu tiên cho các tay trống rock và metal, được biết đến với độ bền.'),
       ('DW (Drum Workshop)', 'dw-brand.jpg', 'Tập trung vào sản phẩm cao cấp, âm thanh tinh tế và thiết kế độc đáo.'),
       ('Mapex', 'mapex-brand.jpg', 'Phổ biến nhờ mức giá hợp lý nhưng chất lượng tốt.'),
       ('Ludwig', 'ludwig-brand.jpg', 'Lịch sử lâu đời, từng được Ringo Starr (The Beatles) sử dụng.');

-- Insert dữ liệu vào bảng sales
INSERT INTO sales (name, discountPercentage, startDate, endDate)
VALUES ('Giảm giá Tết', 20.00, '2024-01-20', '2025-02-10'),
       ('Khuyến mãi Hè', 15.50, '2024-06-01', '2025-06-30'),
       ('Ưu đãi Black Friday', 50.00, '2024-11-25', '2025-11-30'),
       ('Siêu giảm giá Giáng Sinh', 30.00, '2024-12-20', '2025-12-25'),
       ('Mừng khai trương', 10.00, '2024-03-01', '2025-03-07'),
       ('Khuyến mãi cuối năm', 25.00, '2024-12-26', '2025-12-31');

-- Insert dữ liệu vào bảng products
INSERT INTO products (name, description, price, stock, totalViews, isFeatured, status, averageRating, categoryId,
                      brandId)
VALUES ('Bộ trống Yamaha Acoustic',
        'Bộ trống acoustic của Yamaha, chất lượng âm thanh vượt trội, phù hợp cho mọi thể loại nhạc.', 1000000.00, 50,
        120, 1, 1, 4.5, 1, 1),
       ('Trống điện tử Pearl',
        'Bộ trống điện tử Pearl, dễ dàng điều chỉnh âm lượng và hiệu ứng, hoàn hảo cho luyện tập.', 8000000.00, 30, 150,
        0, 1, 4.2, 2, 2),
       ('Trống Snare Tama',
        'Trống snare Tama, âm thanh sắc nét và độ bền cao, phù hợp cho các tay trống chuyên nghiệp.', 2500000.00, 60,
        80, 0, 1, 4.8, 3, 3),
       ('Trống Bass DW', 'Trống bass DW với chất liệu cao cấp và âm thanh sâu lắng, là lựa chọn hoàn hảo cho bộ trống.',
        4000000.00, 40, 90, 0, 1, 4.6, 4, 4),
       ('Cymbal Mapex', 'Cymbal Mapex chất lượng cao, phù hợp cho các bộ trống acoustic và điện tử.', 2000000.00, 70,
        200, 0, 1, 4.7, 5, 5),
       ('Trống Percussion Ludwig',
        'Trống percussion Ludwig mang đến âm thanh phong phú, thích hợp cho các buổi biểu diễn sống.', 1500000.00, 100,
        110, 1, 1, 4.4, 6, 6),
       ('Bộ trống Yamaha Electric',
        'Bộ trống điện tử Yamaha, âm thanh sống động và khả năng kết nối với các thiết bị bên ngoài.', 9500000.00, 50,
        100, 1, 1, 4.3, 1, 1),
       ('Trống Tama Acoustic', 'Trống Tama acoustic với thiết kế mạnh mẽ, đáp ứng yêu cầu của các tay trống rock.',
        5000000.00, 25, 60, 0, 1, 4.6, 2, 2),
       ('Snare Drum DW', 'Snare Drum DW, mang đến âm thanh rõ ràng và sắc bén cho mỗi cú đánh.', 3000000.00, 40, 75, 0,
        1, 4.9, 3, 3),
       ('Trống Bass Pearl', 'Trống bass Pearl có độ sâu tuyệt vời, tạo ra những âm thanh mạnh mẽ cho các buổi diễn.',
        4500000.00, 45, 85, 1, 1, 4.5, 4, 4),
       ('Cymbal Ludwig', 'Cymbal Ludwig với âm thanh đặc trưng, thích hợp cho các thể loại nhạc jazz và rock.',
        2200000.00, 65, 130, 0, 1, 4.6, 5, 5),
       ('Trống Percussion Tama', 'Trống percussion Tama, đem lại trải nghiệm âm nhạc sống động và phong phú.',
        1800000.00, 110, 140, 1, 1, 4.3, 6, 6),
       ('Trống Yamaha Snare', 'Trống snare Yamaha có độ đàn hồi tốt, tạo ra âm thanh sắc nét cho bộ trống của bạn.',
        2500000.00, 55, 95, 0, 1, 4.7, 1, 1),
       ('Bộ trống Pearl Rock', 'Bộ trống Pearl cho các tay trống rock, thiết kế mạnh mẽ và âm thanh mạnh mẽ.',
        12000000.00, 20, 50, 0, 1, 4.8, 2, 2),
       ('Trống Bass Mapex',
        'Trống bass Mapex, mang đến âm trầm sâu và mạnh mẽ, lý tưởng cho các buổi trình diễn trực tiếp.', 3500000.00,
        50, 80, 0, 1, 4.4, 3, 3),
       ('Cymbal DW', 'Cymbal DW với âm thanh tuyệt vời cho các thể loại nhạc mạnh như rock và metal.', 2600000.00, 80,
        160, 1, 1, 4.5, 5, 4),
       ('Trống Snare Ludwig', 'Trống snare Ludwig mang đến âm thanh sáng rõ và sắc nét cho mọi bộ trống.', 2800000.00,
        45, 70, 0, 1, 4.7, 6, 6),
       ('Trống Percussion Yamaha',
        'Trống percussion Yamaha, mang đến âm thanh sống động và hiệu quả trong các buổi biểu diễn.', 1700000.00, 120,
        200, 0, 1, 4.2, 1, 1),
       ('Bộ trống Tama Electronic', 'Bộ trống điện tử Tama, dễ sử dụng và linh hoạt trong các thể loại nhạc khác nhau.',
        8500000.00, 35, 55, 1, 1, 4.4, 2, 2),
       ('Trống DW Snare', 'Trống snare DW, âm thanh sắc bén, độ bền cao, phù hợp cho các tay trống chuyên nghiệp.',
        3200000.00, 40, 90, 0, 1, 4.8, 3, 3),
       ('Bộ trống Pearl Electronic',
        'Bộ trống điện tử Pearl, phù hợp cho người mới bắt đầu và các tay trống luyện tập.', 7000000.00, 60, 130, 0, 1,
        4.3, 4, 4),
       ('Trống Bass Ludwig',
        'Trống bass Ludwig với âm trầm sâu, là sự lựa chọn hoàn hảo cho các buổi biểu diễn trực tiếp.', 4000000.00, 30,
        75, 1, 1, 4.6, 5, 5),
       ('Cymbal Mapex High',
        'Cymbal Mapex với độ bền cao và âm thanh sắc nét, lý tưởng cho các tay trống có kỹ thuật cao.', 2400000.00, 90,
        160, 0, 1, 4.5, 6, 6),
       ('Trống Tama Percussion', 'Trống percussion Tama tạo âm thanh mạnh mẽ và sắc nét cho các buổi biểu diễn.',
        1600000.00, 100, 180, 1, 1, 4.4, 2, 2),
       ('Bộ trống Yamaha Full Set', 'Bộ trống đầy đủ của Yamaha, âm thanh tuyệt vời cho mọi thể loại nhạc.',
        12000000.00, 25, 45, 0, 1, 4.7, 1, 1),
       ('Trống Snare Pearl', 'Trống snare Pearl với âm thanh trong trẻo và độ bền lâu dài.', 2700000.00, 50, 100, 0, 1,
        4.6, 4, 4),
       ('Trống Bass DW Electric', 'Trống bass DW điện tử, dễ dàng điều chỉnh âm thanh cho các buổi biểu diễn.',
        3800000.00, 40, 90, 1, 1, 4.8, 3, 3),
       ('Cymbal Ludwig Professional', 'Cymbal Ludwig, âm thanh chuyên nghiệp cho những buổi biểu diễn đỉnh cao.',
        2300000.00, 75, 140, 0, 1, 4.7, 5, 5),
       ('Trống Percussion Pearl',
        'Trống percussion Pearl với âm thanh sống động, mang lại cảm giác thú vị cho người chơi.', 1900000.00, 115, 170,
        0, 1, 4.3, 6, 6),
       ('Trống điện tử Yamaha EAD10',
        'Trống điện tử Yamaha EAD10 tích hợp các công nghệ tiên tiến, dễ dàng kết nối với các thiết bị bên ngoài.',
        11500000.00, 20, 45, 0, 1, 4.5, 1, 1),
       ('Trống Tama Swingstar',
        'Bộ trống Tama Swingstar với âm thanh đầy mạnh mẽ, lý tưởng cho các buổi biểu diễn rock.', 6000000.00, 35, 80,
        0, 1, 4.3, 2, 2),
       ('Cymbal Zildjian K',
        'Cymbal Zildjian K chất lượng cao với âm thanh trầm ấm, lý tưởng cho jazz và các thể loại nhạc nhẹ.',
        5000000.00, 50, 150, 1, 1, 4.8, 5, 5),
       ('Trống Snare Pearl Master',
        'Trống snare Pearl Master với thiết kế tối ưu và âm thanh hoàn hảo cho các tay trống chuyên nghiệp.',
        6000000.00, 30, 70, 0, 1, 4.6, 4, 4),
       ('Bộ trống Ludwig Classic Maple',
        'Bộ trống Ludwig Classic Maple với âm thanh tự nhiên và độ bền cao, phù hợp cho các nghệ sĩ chơi nhạc sống.',
        12000000.00, 15, 50, 0, 1, 4.9, 6, 6),
       ('Trống Percussion DW Professional',
        'Trống percussion DW Professional với âm thanh mạnh mẽ và sắc nét cho các tay trống đỉnh cao.', 7000000.00, 45,
        100, 1, 1, 4.7, 3, 3),
       ('Trống Bass Mapex Armory',
        'Trống bass Mapex Armory với âm thanh mạnh mẽ, phù hợp cho các thể loại nhạc rock và metal.', 8000000.00, 60,
        110, 0, 1, 4.4, 5, 5),
       ('Trống Snare Ludwig Breakbeats',
        'Trống snare Ludwig Breakbeats, một sự lựa chọn hoàn hảo cho các tay trống hip-hop và jazz.', 3500000.00, 80,
        120, 0, 1, 4.6, 6, 6),
       ('Trống điện tử Pearl ePro Live',
        'Trống điện tử Pearl ePro Live với thiết kế chuyên nghiệp và các tính năng đa dạng cho các buổi biểu diễn.',
        16000000.00, 10, 30, 1, 1, 4.8, 4, 4),
       ('Cymbal Sabian HHX',
        'Cymbal Sabian HHX với âm thanh sáng và sắc nét, lý tưởng cho các thể loại nhạc hard rock và metal.',
        3000000.00, 60, 140, 0, 1, 4.5, 5, 5),
       ('Bộ trống Ludwig Vistalite',
        'Bộ trống Ludwig Vistalite với thiết kế màu sắc đẹp mắt và âm thanh tuyệt vời cho các nghệ sĩ biểu diễn.',
        11000000.00, 20, 50, 0, 1, 4.7, 6, 6),
       ('Trống Snare Mapex Black Panther',
        'Trống snare Mapex Black Panther mang đến âm thanh mạnh mẽ và độ nhạy cao cho các tay trống chuyên nghiệp.',
        4500000.00, 70, 100, 1, 1, 4.6, 5, 5),
       ('Trống Tama Superstar Hyper-Drive',
        'Trống Tama Superstar Hyper-Drive với khả năng phát ra âm thanh mạnh mẽ, là lựa chọn lý tưởng cho các buổi biểu diễn nhạc rock.',
        9500000.00, 30, 65, 0, 1, 4.5, 2, 2),
       ('Trống Bass DW Collector’s Series',
        'Trống bass DW Collector’s Series mang đến âm trầm sâu và mạnh mẽ, lý tưởng cho các nghệ sĩ chơi nhạc trực tiếp.',
        20000000.00, 15, 35, 0, 1, 4.9, 3, 3),
       ('Trống Percussion Ludwig Accent',
        'Trống percussion Ludwig Accent có độ nhạy cao, dễ dàng tạo ra âm thanh mạnh mẽ cho các buổi biểu diễn.',
        3800000.00, 90, 160, 0, 1, 4.4, 6, 6),
       ('Trống Snare Pearl Export',
        'Trống snare Pearl Export cho âm thanh sắc nét và mạnh mẽ, là sự lựa chọn tuyệt vời cho mọi bộ trống.',
        3200000.00, 50, 120, 0, 1, 4.6, 4, 4),
       ('Trống điện tử Roland TD-1K',
        'Trống điện tử Roland TD-1K với khả năng kết nối và điều chỉnh dễ dàng, thích hợp cho cả người mới bắt đầu và người chơi chuyên nghiệp.',
        9000000.00, 25, 45, 1, 1, 4.7, 1, 1),
       ('Cymbal Zildjian A Custom',
        'Cymbal Zildjian A Custom mang đến âm thanh sáng và đầy đủ cho mọi thể loại nhạc, đặc biệt là jazz.',
        3500000.00, 65, 140, 1, 1, 4.7, 5, 5),
       ('Trống Snare Yamaha Recording Custom',
        'Trống snare Yamaha Recording Custom, âm thanh rõ ràng và sắc nét cho mọi bộ trống.', 6500000.00, 30, 60, 0, 1,
        4.6, 1, 1),
       ('Bộ trống Tama Imperialstar',
        'Bộ trống Tama Imperialstar với thiết kế chắc chắn và âm thanh mạnh mẽ, thích hợp cho các tay trống nghiệp dư.',
        7000000.00, 50, 100, 1, 1, 4.3, 2, 2),
       ('Trống Bass Mapex M-Birch',
        'Trống bass Mapex M-Birch với âm thanh sâu và mạnh mẽ, lý tưởng cho các buổi biểu diễn nhạc rock.', 4000000.00,
        60, 130, 1, 1, 4.4, 5, 5),
       ('Trống Snare Ludwig Legacy',
        'Trống snare Ludwig Legacy mang đến âm thanh hoàn hảo và độ bền lâu dài cho các tay trống.', 5500000.00, 50,
        110, 0, 1, 4.7, 6, 6),
       ('Trống điện tử Roland TD-27KVX',
        'Trống điện tử Roland TD-27KVX với các cảm biến nhạy bén và âm thanh sống động, thích hợp cho mọi thể loại nhạc.',
        24000000.00, 10, 45, 0, 1, 4.9, 1, 1),
       ('Bộ trống Ludwig Classic',
        'Bộ trống Ludwig Classic với thiết kế cổ điển và âm thanh ấm áp, rất phù hợp cho các nghệ sĩ yêu thích thể loại jazz.',
        15000000.00, 20, 50, 1, 1, 4.7, 6, 6),
       ('Trống Tama Superstar Hyper-Drive',
        'Trống Tama Superstar Hyper-Drive có thiết kế chắc chắn và âm thanh mạnh mẽ, hoàn hảo cho những buổi biểu diễn nhạc rock.',
        11000000.00, 25, 70, 0, 1, 4.6, 2, 2),
       ('Trống Snare Yamaha Stage Custom',
        'Trống snare Yamaha Stage Custom với âm thanh sắc nét và dễ điều chỉnh, rất phù hợp cho các tay trống nghiệp dư.',
        3500000.00, 30, 80, 0, 1, 4.4, 1, 1),
       ('Cymbal Zildjian A Series',
        'Cymbal Zildjian A Series có âm thanh sáng và sắc nét, lý tưởng cho các thể loại nhạc jazz và fusion.',
        7000000.00, 40, 100, 1, 1, 4.8, 5, 5),
       ('Trống điện tử Pearl Mimic Pro',
        'Trống điện tử Pearl Mimic Pro với các tính năng đặc biệt và khả năng kết nối tối ưu, dành cho các tay trống chuyên nghiệp.',
        35000000.00, 5, 15, 0, 1, 4.9, 4, 4),
       ('Bộ trống Mapex Mars',
        'Bộ trống Mapex Mars với âm thanh mạnh mẽ và độ bền cao, lý tưởng cho các tay trống mới bắt đầu.', 8000000.00,
        30, 65, 0, 1, 4.3, 5, 5),
       ('Trống Bass Pearl Export',
        'Trống bass Pearl Export với âm thanh ấm áp và mạnh mẽ, rất lý tưởng cho các nghệ sĩ chơi nhạc rock.',
        5000000.00, 50, 90, 0, 1, 4.5, 4, 4),
       ('Cymbal Sabian B8X',
        'Cymbal Sabian B8X mang đến âm thanh sắc nét và độ bền cao, lý tưởng cho các tay trống yêu thích âm thanh mạnh mẽ.',
        4000000.00, 60, 150, 1, 1, 4.6, 5, 5),
       ('Trống Tama Imperialstar',
        'Trống Tama Imperialstar với thiết kế đẹp mắt và âm thanh mạnh mẽ, phù hợp cho các nghệ sĩ mới bắt đầu.',
        7000000.00, 35, 70, 0, 1, 4.4, 2, 2),
       ('Trống Snare Mapex Black Panther',
        'Trống snare Mapex Black Panther với âm thanh sắc nét và độ bền cao, thích hợp cho các tay trống chuyên nghiệp.',
        4000000.00, 45, 90, 0, 1, 4.7, 5, 5),
       ('Trống điện tử Roland TD-50',
        'Trống điện tử Roland TD-50 với cảm biến và âm thanh hiện đại, phù hợp cho các nghệ sĩ biểu diễn chuyên nghiệp.',
        60000000.00, 3, 10, 1, 1, 5.0, 1, 1),
       ('Bộ trống Pearl Roadshow',
        'Bộ trống Pearl Roadshow được thiết kế đặc biệt cho các nghệ sĩ mới bắt đầu, với âm thanh mạnh mẽ và độ bền cao.',
        7500000.00, 20, 50, 0, 1, 4.5, 4, 4),
       ('Trống Snare Ludwig Supraphonic',
        'Trống snare Ludwig Supraphonic với âm thanh mạnh mẽ và đặc biệt, là lựa chọn lý tưởng cho các tay trống jazz và rock.',
        10000000.00, 25, 55, 1, 1, 4.8, 6, 6),
       ('Trống điện tử Yamaha DTX6',
        'Trống điện tử Yamaha DTX6 với âm thanh chân thực và cảm biến nhạy bén, rất phù hợp cho các nghệ sĩ chuyên nghiệp và bán chuyên.',
        19000000.00, 8, 20, 0, 1, 4.6, 1, 1),
       ('Bộ trống Ludwig Legacy',
        'Bộ trống Ludwig Legacy với thiết kế đẹp mắt và âm thanh trầm ấm, là lựa chọn lý tưởng cho các nghệ sĩ chơi nhạc nhẹ.',
        20000000.00, 15, 30, 0, 1, 4.7, 6, 6),
       ('Trống Snare Yamaha Recording Custom',
        'Trống snare Yamaha Recording Custom với âm thanh sắc nét và độ bền cao, lý tưởng cho các tay trống chuyên nghiệp.',
        8000000.00, 20, 40, 0, 1, 4.5, 1, 1),
       ('Trống Bass DW Collector’s Series',
        'Trống bass DW Collector’s Series mang đến âm thanh sâu và mạnh mẽ, lý tưởng cho các nghệ sĩ chơi nhạc trực tiếp.',
        50000000.00, 5, 15, 1, 1, 4.9, 3, 3),
       ('Trống Tama Starclassic',
        'Trống Tama Starclassic với âm thanh mạnh mẽ và chất lượng tuyệt vời, lý tưởng cho các tay trống rock và metal.',
        20000000.00, 10, 30, 0, 1, 4.6, 2, 2),
       ('Trống Snare Pearl Masterworks',
        'Trống snare Pearl Masterworks với âm thanh tuyệt vời và thiết kế hiện đại, lý tưởng cho các tay trống biểu diễn.',
        10000000.00, 20, 50, 1, 1, 4.7, 4, 4),
       ('Trống điện tử Roland TD-17',
        'Trống điện tử Roland TD-17 với cảm biến nhạy bén và các tính năng hiện đại, phù hợp cho các tay trống mới bắt đầu.',
        15000000.00, 25, 60, 0, 1, 4.6, 1, 1);


INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdset-nh-trong-stack-viva.jpg', 1, 1);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-bdset-sh-trong-bass-viva.jpg', 0, 1);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-sth1450br.jpg', 0, 1);
INSERT INTO product_images (image, isMain, productId) VALUES ('trong-pearl-roadshow-505.jpg', 0, 1);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-nitro-mesh-kit.jpg', 0, 1);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-17kv-2.jpg', 1, 2);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-export-exx725sp-c777-trong-bo-mau-slipstream-white.jpg', 0, 2);
INSERT INTO product_images (image, isMain, productId) VALUES ('d-addario-evans-mat-trong-tt14hb.jpg', 0, 2);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-dmp0807t-c261-trong-tom-8x7-mau-gloss-deep-red-burst.jpg', 0, 2);
INSERT INTO product_images (image, isMain, productId) VALUES ('d-addario-evans-mat-trong-tt13hb.jpg', 0, 2);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-sth1450br.jpg', 1, 3);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-decade-maple-dmpc925sp-c889-bo-mau-gloss-exotic-maple.jpg', 0, 3);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-nitro-mesh-kit.jpg', 0, 3);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-matte-natural-mus1465m224.jpg', 0, 3);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-07dmk.jpg', 0, 3);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-caix-caixn-trong-caixon.jpg', 1, 4);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-sth1465al-sensitone-heritage-alloy-14.jpg', 0, 4);
INSERT INTO product_images (image, isMain, productId) VALUES ('pad-tap-trong-d-addario-rf6d.jpg', 0, 4);
INSERT INTO product_images (image, isMain, productId) VALUES ('d-addario-evans-mat-trong-tt14hb.jpg', 0, 4);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-cset-sh-trong-congas-viva.jpg', 0, 4);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdj10-sh-trong-djembe-viva.jpg', 1, 5);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-t12-nh-trong-timbas.jpg', 0, 5);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-17kv-l.jpg', 0, 5);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-17kv-2.jpg', 0, 5);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-vad-504.jpg', 0, 5);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-cset-nh-trong-congas-viva.jpg', 1, 6);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-nitro-max-kit.png', 0, 6);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-surge-mesh-kit.jpg', 0, 6);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-t12-sh-trong-timbas.jpg', 0, 6);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-cset-sh-trong-congas-viva.jpg', 0, 6);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-50k.jpg', 1, 7);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdj10-sh-trong-djembe-viva.jpg', 0, 7);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-vad-504.jpg', 0, 7);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-02kv.jpg', 0, 7);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-nitro-mesh-se-kit.png', 0, 7);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-cset-nh-trong-congas-viva.jpg', 1, 8);
INSERT INTO product_images (image, isMain, productId) VALUES ('d-addario-evans-mat-trong-tt08ecr.jpg', 0, 8);
INSERT INTO product_images (image, isMain, productId) VALUES ('lazer-pad-tap-trong-pc13-51.jpg', 0, 8);
INSERT INTO product_images (image, isMain, productId) VALUES ('d-addario-evans-mat-trong-s13h30.jpg', 0, 8);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-vad-706.jpg', 0, 8);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-vad-504.jpg', 1, 9);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-sth1465al-sensitone-heritage-alloy-14.jpg', 0, 9);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdj9-sh-trong-djembe-viva.jpg', 0, 9);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-caix-caixn-trong-caixon.jpg', 0, 9);
INSERT INTO product_images (image, isMain, productId) VALUES ('d-addario-evans-mat-trong-tt13hb.jpg', 0, 9);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-cset-nh-trong-congas-viva.jpg', 1, 10);
INSERT INTO product_images (image, isMain, productId) VALUES ('pad-tap-trong-d-addario-rf6d.jpg', 0, 10);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-07dmk.jpg', 0, 10);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-nitro-mesh-se-kit.png', 0, 10);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-command-mesh-kit.jpg', 0, 10);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-sth1465al-sensitone-heritage-alloy-14.jpg', 1, 11);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-02kv.jpg', 0, 11);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-crimson-ii-se.jpg', 0, 11);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-matte-natural-mus1465m224.jpg', 0, 11);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-decade-maple-dmpc925sp-c889-bo-mau-gloss-exotic-maple.jpg', 0, 11);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdj10-sh-trong-djembe-viva.jpg', 1, 12);
INSERT INTO product_images (image, isMain, productId) VALUES ('zildjian-zs5a-cap-dui-trong-super-5a.jpg', 0, 12);
INSERT INTO product_images (image, isMain, productId) VALUES ('d-addario-evans-mat-trong-tt13hb.jpg', 0, 12);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-export-exx725sp-c778-trong-bo-mau-metallic-silver-twst.jpg', 0, 12);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-vad-706.jpg', 0, 12);
INSERT INTO product_images (image, isMain, productId) VALUES ('lazer-pad-tap-trong-pc13-52.png', 1, 13);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-trong-bo-conga-pwc-202.jpg', 0, 13);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-decade-maple-dmpc925sp-c828-bo-mau-matee-dark-walnut.jpg', 0, 13);
INSERT INTO product_images (image, isMain, productId) VALUES ('pad-tap-trong-d-addario-rf6d.jpg', 0, 13);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-t-bo-kich-22.jpg', 0, 13);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdj9-sh-trong-djembe-viva.jpg', 1, 14);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-02kv.jpg', 0, 14);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-vad-504.jpg', 0, 14);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-vad-507.jpg', 0, 14);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-t-bo-kich-22.jpg', 0, 14);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-sth1450br.jpg', 1, 15);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-surge-se-kit.jpg', 0, 15);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-vad-706.jpg', 0, 15);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-vad-504.jpg', 0, 15);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdset-nh-trong-stack-viva.jpg', 0, 15);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-50k.jpg', 1, 16);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-debut-kit.jpg', 0, 16);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-07kv.jpg', 0, 16);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-17kl.jpg', 0, 16);
INSERT INTO product_images (image, isMain, productId) VALUES ('d-addrio-evans-mat-trong-b1420.jpg', 0, 16);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-sth1465br.jpg', 1, 17);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-sth1465al-sensitone-heritage-alloy-14.jpg', 0, 17);
INSERT INTO product_images (image, isMain, productId) VALUES ('d-addario-evans-mat-trong-tt08ecr.jpg', 0, 17);
INSERT INTO product_images (image, isMain, productId) VALUES ('d-addario-evans-mat-trong-s13h30.jpg', 0, 17);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdj9-sh-trong-djembe-viva.jpg', 0, 17);
INSERT INTO product_images (image, isMain, productId) VALUES ('d-addario-evans-mat-trong-tt13hb.jpg', 1, 18);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-nitro-mesh-se-kit.png', 0, 18);
INSERT INTO product_images (image, isMain, productId) VALUES ('trong-pearl-roadshow-rs525-standard.jpg', 0, 18);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-decade-maple-dmp925fp-c261-bo-mau-gloss-deep-red-burst.jpg', 0, 18);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-t12-nh-trong-timbas.jpg', 0, 18);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-command-mesh-kit.jpg', 1, 19);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-1dmk.jpg', 0, 19);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-nitro-mesh-se-kit.png', 0, 19);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-25kvx-kd-180.jpg', 0, 19);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdj9-nh-trong-djembe-viva.jpg', 0, 19);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-trong-bo-conga-pwc-202.jpg', 1, 20);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdj9-nh-trong-djembe-viva.jpg', 0, 20);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-debut-kit.jpg', 0, 20);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdset-sh-trong-stack-viva.jpg', 0, 20);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-surge-mesh-kit.jpg', 0, 20);
INSERT INTO product_images (image, isMain, productId) VALUES ('d-addario-evans-mat-trong-tt14hb.jpg', 1, 21);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdset-sh-trong-stack-viva.jpg', 0, 21);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-vad-504.jpg', 0, 21);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-decade-maple-dmpc925sp-c828-bo-mau-matee-dark-walnut.jpg', 0, 21);
INSERT INTO product_images (image, isMain, productId) VALUES ('lazer-pad-tap-trong-pc13-51.jpg', 0, 21);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-sth1465br.jpg', 1, 22);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-crimson-ii-se.jpg', 0, 22);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-vad-504.jpg', 0, 22);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-vad-507.jpg', 0, 22);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-decade-maple-dmp925fp-c261-bo-mau-gloss-deep-red-burst.jpg', 0, 22);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdset-nh-trong-stack-viva.jpg', 1, 23);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-vad-507.jpg', 0, 23);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-t-bo-kich-22.jpg', 0, 23);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-export-exx725sp-c779-trong-bo-mau-metallic-amethyst-tw.jpg', 0, 23);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-50kvx.jpg', 0, 23);
INSERT INTO product_images (image, isMain, productId) VALUES ('trong-pearl-roadshow-584-jazz-style.gif', 1, 24);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-nitro-max-kit.png', 0, 24);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-17kv-x2.jpg', 0, 24);
INSERT INTO product_images (image, isMain, productId) VALUES ('d-addario-evans-mat-trong-tt13hb.jpg', 0, 24);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-vad-507.jpg', 0, 24);
INSERT INTO product_images (image, isMain, productId) VALUES ('odery-cafekit-bs-trong-bo-mau-blue-sparkle-finish.jpg', 1, 25);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-nitro-mesh-kit.jpg', 0, 25);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdset-nh-trong-stack-viva.jpg', 0, 25);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdj10-sh-trong-djembe-viva.jpg', 0, 25);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-sth1450br.jpg', 0, 25);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-decade-maple-dmpc925sp-c889-bo-mau-gloss-exotic-maple.jpg', 1, 26);
INSERT INTO product_images (image, isMain, productId) VALUES ('pad-tap-trong-d-addario-rf6d.jpg', 0, 26);
INSERT INTO product_images (image, isMain, productId) VALUES ('d-addrio-evans-mat-trong-b1420.jpg', 0, 26);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-17kl.jpg', 0, 26);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-decade-maple-dmp925fp-c261-bo-mau-gloss-deep-red-burst.jpg', 0, 26);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdset-sh-trong-stack-viva.jpg', 1, 27);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-vad-504.jpg', 0, 27);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-export-exx725sp-c779-trong-bo-mau-metallic-amethyst-tw.jpg', 0, 27);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-decade-maple-dmpc925sp-c828-bo-mau-matee-dark-walnut.jpg', 0, 27);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-s-930d.jpg', 0, 27);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-t-bo-kich-22.jpg', 1, 28);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-surge-mesh-kit.jpg', 0, 28);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdset-sh-trong-stack-viva.jpg', 0, 28);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-07kv.jpg', 0, 28);
INSERT INTO product_images (image, isMain, productId) VALUES ('trong-pearl-roadshow-584-jazz-style.gif', 0, 28);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-bdset-sh-trong-bass-viva.jpg', 1, 29);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-s-930d.jpg', 0, 29);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-nitro-mesh-kit.jpg', 0, 29);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-vad-504.jpg', 0, 29);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-sth1450br.jpg', 0, 29);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-command-mesh-kit.jpg', 1, 30);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-17kv-2.jpg', 0, 30);
INSERT INTO product_images (image, isMain, productId) VALUES ('pad-tap-trong-d-addario-rf6d.jpg', 0, 30);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdj9-nh-trong-djembe-viva.jpg', 0, 30);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-vad-507.jpg', 0, 30);
INSERT INTO product_images (image, isMain, productId) VALUES ('d-addario-mat-trong-b13g2.jpg', 1, 31);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-surge-mesh-kit.jpg', 0, 31);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-t-bo-kich-22.jpg', 0, 31);
INSERT INTO product_images (image, isMain, productId) VALUES ('lazer-pad-tap-trong-pc13-52.png', 0, 31);
INSERT INTO product_images (image, isMain, productId) VALUES ('combo-exx725sp-c760.jpg', 0, 31);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-25kvx-kd-180.jpg', 1, 32);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-25kvx-kd-220.jpg', 0, 32);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdset-nh-trong-stack-viva.jpg', 0, 32);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-command-se-kit.jpg', 0, 32);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-02k.png', 0, 32);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-t12-nh-trong-timbas.jpg', 1, 33);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-surge-se-kit.jpg', 0, 33);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-decade-maple-dmpc925sp-c889-bo-mau-gloss-exotic-maple.jpg', 0, 33);
INSERT INTO product_images (image, isMain, productId) VALUES ('combo-exx725sp-c760.jpg', 0, 33);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-dmp0807t-c261-trong-tom-8x7-mau-gloss-deep-red-burst.jpg', 0, 33);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-command-mesh-kit.jpg', 1, 34);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-caix-caixn-trong-caixon.jpg', 0, 34);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-07kv.jpg', 0, 34);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdset-sh-trong-stack-viva.jpg', 0, 34);
INSERT INTO product_images (image, isMain, productId) VALUES ('d-addario-evans-mat-trong-tt14hb.jpg', 0, 34);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-debut-kit.jpg', 1, 35);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-17kv-l.jpg', 0, 35);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-command-se-kit.jpg', 0, 35);
INSERT INTO product_images (image, isMain, productId) VALUES ('trong-compact-traveler-kit-pctk-1810.gif', 0, 35);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-nitroprokit.jpg', 0, 35);
INSERT INTO product_images (image, isMain, productId) VALUES ('trong-pearl-roadshow-505.jpg', 1, 36);
INSERT INTO product_images (image, isMain, productId) VALUES ('lazer-pad-tap-trong-pc13-51.jpg', 0, 36);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-50kvx.jpg', 0, 36);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-vad-507.jpg', 0, 36);
INSERT INTO product_images (image, isMain, productId) VALUES ('d-addario-evans-mat-trong-s13h30.jpg', 0, 36);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-50kvx.jpg', 1, 37);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-vad-504.jpg', 0, 37);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-decade-maple-dmp905p-c215-trong-bo-mau-satin-gold.jpg', 0, 37);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-matte-natural-mus1465m224.jpg', 0, 37);
INSERT INTO product_images (image, isMain, productId) VALUES ('d-addario-evans-mat-trong-tt13hb.jpg', 0, 37);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdset-nh-trong-stack-viva.jpg', 1, 38);
INSERT INTO product_images (image, isMain, productId) VALUES ('pad-tap-trong-d-addario-rf6d.jpg', 0, 38);
INSERT INTO product_images (image, isMain, productId) VALUES ('trong-pearl-roadshow-rs525-standard.jpg', 0, 38);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-50k.jpg', 0, 38);
INSERT INTO product_images (image, isMain, productId) VALUES ('odery-cafekit-bs-trong-bo-mau-blue-sparkle-finish.jpg', 0, 38);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-17kv-x2.jpg', 1, 39);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-decade-maple-dmp905p-c215-trong-bo-mau-satin-gold.jpg', 0, 39);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-command-mesh-kit.jpg', 0, 39);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-nitro-mesh-se-kit.png', 0, 39);
INSERT INTO product_images (image, isMain, productId) VALUES ('d-addario-evans-mat-trong-tt13hb.jpg', 0, 39);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-t-bo-kich-22.jpg', 1, 40);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-17kl.jpg', 0, 40);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-matte-natural-mus1465m224.jpg', 0, 40);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-caix-caixn-trong-caixon.jpg', 0, 40);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-25kvx-kd-180.jpg', 0, 40);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdset-nh-trong-stack-viva.jpg', 1, 41);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-sth1465al-sensitone-heritage-alloy-14.jpg', 0, 41);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-decade-maple-dmpc925sp-c828-bo-mau-matee-dark-walnut.jpg', 0, 41);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-export-exx725sp-c777-trong-bo-mau-slipstream-white.jpg', 0, 41);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-50kvx.jpg', 0, 41);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-sth1450al-sensitone-heritage-alloy-14.jpg', 1, 42);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-17kv-l.jpg', 0, 42);
INSERT INTO product_images (image, isMain, productId) VALUES ('lazer-pad-tap-trong-pc13-51.jpg', 0, 42);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-02k.png', 0, 42);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-caix-caixn-trong-caixon.jpg', 0, 42);
INSERT INTO product_images (image, isMain, productId) VALUES ('lazer-pad-tap-trong-pc13-51.jpg', 1, 43);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-caix-caixn-trong-caixon.jpg', 0, 43);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-bdset-sh-trong-bass-viva.jpg', 0, 43);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-nitro-mesh-kit.jpg', 0, 43);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-command-se-kit.jpg', 0, 43);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdj9-nh-trong-djembe-viva.jpg', 1, 44);
INSERT INTO product_images (image, isMain, productId) VALUES ('spd-sx-pro.jpg', 0, 44);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdset-sh-trong-stack-viva.jpg', 0, 44);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdj12-nh-trong-djembe-viva.jpg', 0, 44);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-export-exx725sp-c777-trong-bo-mau-slipstream-white.jpg', 0, 44);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdset-sh-trong-stack-viva.jpg', 1, 45);
INSERT INTO product_images (image, isMain, productId) VALUES ('trong-pearl-roadshow-584-jazz-style.gif', 0, 45);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-decade-maple-dmp905p-c215-trong-bo-mau-satin-gold.jpg', 0, 45);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-cset-sh-trong-congas-viva.jpg', 0, 45);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-17kv-x2.jpg', 0, 45);
INSERT INTO product_images (image, isMain, productId) VALUES ('lazer-pad-tap-trong-pc13-52.png', 1, 46);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdset-sh-trong-stack-viva.jpg', 0, 46);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-caix-caixn-trong-caixon.jpg', 0, 46);
INSERT INTO product_images (image, isMain, productId) VALUES ('trong-pearl-roadshow-584-jazz-style.gif', 0, 46);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-02kv.jpg', 0, 46);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-s-930d.jpg', 1, 47);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-export-exx725sp-c779-trong-bo-mau-metallic-amethyst-tw.jpg', 0, 47);
INSERT INTO product_images (image, isMain, productId) VALUES ('trong-pearl-roadshow-505.jpg', 0, 47);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-export-exx725sp-c777-trong-bo-mau-slipstream-white.jpg', 0, 47);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-17kl.jpg', 0, 47);
INSERT INTO product_images (image, isMain, productId) VALUES ('d-addario-evans-mat-trong-tt13hb.jpg', 1, 48);
INSERT INTO product_images (image, isMain, productId) VALUES ('trong-pearl-roadshow-584-jazz-style.gif', 0, 48);
INSERT INTO product_images (image, isMain, productId) VALUES ('spd-sx-pro.jpg', 0, 48);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-07kv.jpg', 0, 48);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-sth1450br.jpg', 0, 48);
INSERT INTO product_images (image, isMain, productId) VALUES ('odery-cafekit-bs-trong-bo-mau-blue-sparkle-finish.jpg', 1, 49);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdj9-nh-trong-djembe-viva.jpg', 0, 49);
INSERT INTO product_images (image, isMain, productId) VALUES ('trong-pearl-roadshow-505.jpg', 0, 49);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-export-exx725sp-c778-trong-bo-mau-metallic-silver-twst.jpg', 0, 49);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-t12-sh-trong-timbas.jpg', 0, 49);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-decade-maple-dmp905p-c215-trong-bo-mau-satin-gold.jpg', 1, 50);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-export-exx725sp-c778-trong-bo-mau-metallic-silver-twst.jpg', 0, 50);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-50kvx.jpg', 0, 50);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-sth1465br.jpg', 0, 50);
INSERT INTO product_images (image, isMain, productId) VALUES ('lazer-pad-tap-trong-pc13-52.png', 0, 50);
INSERT INTO product_images (image, isMain, productId) VALUES ('pad-tap-trong-d-addario-rf6d.jpg', 1, 51);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-50k.jpg', 0, 51);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-50kvx.jpg', 0, 51);
INSERT INTO product_images (image, isMain, productId) VALUES ('trong-pearl-roadshow-584-jazz-style.gif', 0, 51);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-17kv-2.jpg', 0, 51);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-t12-sh-trong-timbas.jpg', 1, 52);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-decade-maple-dmp925fp-c261-bo-mau-gloss-deep-red-burst.jpg', 0, 52);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-nitroprokit.jpg', 0, 52);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-command-mesh-kit.jpg', 0, 52);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-bdset-nh-trong-bass-viva.jpg', 0, 52);
INSERT INTO product_images (image, isMain, productId) VALUES ('odery-cafekit-bs-trong-bo-mau-blue-sparkle-finish.jpg', 1, 53);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-17kl.jpg', 0, 53);
INSERT INTO product_images (image, isMain, productId) VALUES ('trong-compact-traveler-kit-pctk-1810.gif', 0, 53);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-50kvx.jpg', 0, 53);
INSERT INTO product_images (image, isMain, productId) VALUES ('pad-tap-trong-d-addario-rf6d.jpg', 0, 53);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-decade-maple-dmpc925sp-c889-bo-mau-gloss-exotic-maple.jpg', 1, 54);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-vad-504.jpg', 0, 54);
INSERT INTO product_images (image, isMain, productId) VALUES ('combo-exx725sp-c760.jpg', 0, 54);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-07kv.jpg', 0, 54);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-bdset-nh-trong-bass-viva.jpg', 0, 54);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-sth1465al-sensitone-heritage-alloy-14.jpg', 1, 55);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-17kv-l.jpg', 0, 55);
INSERT INTO product_images (image, isMain, productId) VALUES ('lazer-pad-tap-trong-pc13-52.png', 0, 55);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-17kv-2.jpg', 0, 55);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-nitroprokit.jpg', 0, 55);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdj9-sh-trong-djembe-viva.jpg', 1, 56);
INSERT INTO product_images (image, isMain, productId) VALUES ('trong-pearl-roadshow-584-jazz-style.gif', 0, 56);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-25kvx-kd-220.jpg', 0, 56);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-17kl.jpg', 0, 56);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-sth1465al-sensitone-heritage-alloy-14.jpg', 0, 56);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-decade-maple-dmpc925sp-c889-bo-mau-gloss-exotic-maple.jpg', 1, 57);
INSERT INTO product_images (image, isMain, productId) VALUES ('odery-cafekit-bs-trong-bo-mau-blue-sparkle-finish.jpg', 0, 57);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-25kvx-kd-180.jpg', 0, 57);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-crimson-ii-se.jpg', 0, 57);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-17kl.jpg', 0, 57);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-t12-sh-trong-timbas.jpg', 1, 58);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-nitro-mesh-se-kit.png', 0, 58);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-sth1450al-sensitone-heritage-alloy-14.jpg', 0, 58);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-02k.png', 0, 58);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdj12-nh-trong-djembe-viva.jpg', 0, 58);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-25kvx-kd-180.jpg', 1, 59);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-bdset-nh-trong-bass-viva.jpg', 0, 59);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-vad-504.jpg', 0, 59);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-sth1465al-sensitone-heritage-alloy-14.jpg', 0, 59);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-decade-maple-dmpc925sp-c889-bo-mau-gloss-exotic-maple.jpg', 0, 59);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdset-sh-trong-stack-viva.jpg', 1, 60);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-17kl.jpg', 0, 60);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-50k.jpg', 0, 60);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-02k.png', 0, 60);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-matte-natural-mus1465m224.jpg', 0, 60);
INSERT INTO product_images (image, isMain, productId) VALUES ('zildjian-zs5a-cap-dui-trong-super-5a.jpg', 1, 61);
INSERT INTO product_images (image, isMain, productId) VALUES ('trong-compact-traveler-kit-pctk-1810.gif', 0, 61);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-50k.jpg', 0, 61);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-decade-maple-dmpc925sp-c889-bo-mau-gloss-exotic-maple.jpg', 0, 61);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-17kv-2.jpg', 0, 61);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-sth1465br.jpg', 1, 62);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-nitro-mesh-se-kit.png', 0, 62);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-25kvx-kd-180.jpg', 0, 62);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-crimson-ii-se.jpg', 0, 62);
INSERT INTO product_images (image, isMain, productId) VALUES ('pad-tap-trong-d-addario-rf6d.jpg', 0, 62);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-07kv.jpg', 1, 63);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-17kv-2.jpg', 0, 63);
INSERT INTO product_images (image, isMain, productId) VALUES ('d-addrio-evans-mat-trong-b1420.jpg', 0, 63);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-s-930d.jpg', 0, 63);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-decade-maple-dmp925fp-c261-bo-mau-gloss-deep-red-burst.jpg', 0, 63);
INSERT INTO product_images (image, isMain, productId) VALUES ('pad-tap-trong-d-addario-rf6d.jpg', 1, 64);
INSERT INTO product_images (image, isMain, productId) VALUES ('d-addrio-evans-mat-trong-b1420.jpg', 0, 64);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-command-mesh-kit.jpg', 0, 64);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-surge-se-kit.jpg', 0, 64);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-decade-maple-dmp905p-c215-trong-bo-mau-satin-gold.jpg', 0, 64);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdj9-nh-trong-djembe-viva.jpg', 1, 65);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-vad-504.jpg', 0, 65);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-command-se-kit.jpg', 0, 65);
INSERT INTO product_images (image, isMain, productId) VALUES ('lazer-pad-tap-trong-pc13-52.png', 0, 65);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-nitro-mesh-se-kit.png', 0, 65);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-17kv-2.jpg', 1, 66);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-command-se-kit.jpg', 0, 66);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-50k.jpg', 0, 66);
INSERT INTO product_images (image, isMain, productId) VALUES ('trong-pearl-roadshow-rs525-standard.jpg', 0, 66);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-decade-maple-dmpc925sp-c828-bo-mau-matee-dark-walnut.jpg', 0, 66);
INSERT INTO product_images (image, isMain, productId) VALUES ('pad-tap-trong-d-addario-rf6d.jpg', 1, 67);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-dmp0807t-c261-trong-tom-8x7-mau-gloss-deep-red-burst.jpg', 0, 67);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-sth1465br.jpg', 0, 67);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-surge-mesh-kit.jpg', 0, 67);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-decade-maple-dmpc925sp-c889-bo-mau-gloss-exotic-maple.jpg', 0, 67);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-sth1450al-sensitone-heritage-alloy-14.jpg', 1, 68);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-vad-706.jpg', 0, 68);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-nitro-max-kit.png', 0, 68);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-1dmk.jpg', 0, 68);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-vad-504.jpg', 0, 68);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-export-exx725sp-c777-trong-bo-mau-slipstream-white.jpg', 1, 69);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-decade-maple-dmpc925sp-c889-bo-mau-gloss-exotic-maple.jpg', 0, 69);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-sth1465al-sensitone-heritage-alloy-14.jpg', 0, 69);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdj9-nh-trong-djembe-viva.jpg', 0, 69);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdset-nh-trong-stack-viva.jpg', 0, 69);
INSERT INTO product_images (image, isMain, productId) VALUES ('d-addario-evans-mat-trong-s13h30.jpg', 1, 70);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-decade-maple-dmp925fp-c261-bo-mau-gloss-deep-red-burst.jpg', 0, 70);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-sth1450br.jpg', 0, 70);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-debut-kit.jpg', 0, 70);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-t12-sh-trong-timbas.jpg', 0, 70);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-vad-507.jpg', 1, 71);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-sdj10-sh-trong-djembe-viva.jpg', 0, 71);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-02kv.jpg', 0, 71);
INSERT INTO product_images (image, isMain, productId) VALUES ('trong-pearl-roadshow-584-jazz-style.gif', 0, 71);
INSERT INTO product_images (image, isMain, productId) VALUES ('trong-pearl-roadshow-505.jpg', 0, 71);
INSERT INTO product_images (image, isMain, productId) VALUES ('pearl-matte-natural-mus1465m224.jpg', 1, 72);
INSERT INTO product_images (image, isMain, productId) VALUES ('alesis-surge-se-kit.jpg', 0, 72);
INSERT INTO product_images (image, isMain, productId) VALUES ('roland-td-50kvx.jpg', 0, 72);
INSERT INTO product_images (image, isMain, productId) VALUES ('odery-cafekit-bs-trong-bo-mau-blue-sparkle-finish.jpg', 0, 72);
INSERT INTO product_images (image, isMain, productId) VALUES ('viva-vr-bdset-nh-trong-bass-viva.jpg', 0, 72);

INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jeremy46@example.com', '%0_6CkpI)kGY', 'April Peterson', 0, '967-886-6506x0994', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('toddhaas@example.com', 'Nt1DNu%Z@5#(', 'William Phillips', 0, '617.381.2030', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('sheltonjeffrey@example.net', 'lBBnL&yY*1MO', 'Sarah Cruz', 0, '+1-246-201-9653x5460', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('samantha94@example.net', 'DQxs^9Vc%k)y', 'Larry Tate', 1, '666-580-0545x12727', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('cookmargaret@example.org', '0JK4Alax*Y%_', 'Maria Thompson', 1, '+1-214-647-8164', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('joshuasanchez@example.net', '#YHrk^qUV7ME', 'Beverly Young', 1, '001-704-781-6176x19398', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('chenandrew@example.com', '3w5Eefru^WRU', 'Thomas Collins', 0, '(214)275-5321x913', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('vburke@example.net', '&rHYpDH&6!bO', 'Joshua Baldwin', 0, '+1-588-868-1077x498', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('ayalastephen@example.net', '2$6WrCgmQ^*o', 'Melissa Underwood', 0, '(778)974-2790x90017', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('tracybarnett@example.org', 'y6kFbfMc%F_Q', 'Charles Barnes', 0, '(772)244-7742x7578', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('torresjames@example.com', 'I@NLOv9kFhV4', 'Paula Haas', 0, '+1-823-564-4970x2921', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('lisa63@example.org', 'c2F0ReE3)Sd+', 'Kevin Gonzales', 1, '(859)586-9038', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jerryluna@example.com', 'b1S1cRjw$l$t', 'Jerry Hampton', 0, '(512)873-6128', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('tbyrd@example.net', '%V6E78)hZ1Qn', 'Stephanie French', 0, '001-936-416-0099x56209', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('gnelson@example.com', 'a3EcHUhB+O7(', 'James Mcclure', 0, '934-367-6048x8983', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jonesamanda@example.com', 'P*I15YJarV+i', 'Belinda Jordan', 1, '+1-248-716-2960x39581', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('masseychristina@example.com', '_SW4Tnrse^sm', 'Alyssa Aguilar', 0, '(237)776-4863x28984', 1, '452613735_1036702941161043_2918307811633307299_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jacqueline64@example.com', '&G$YtUqu2o48', 'Elizabeth Small', 1, '(299)920-3208', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('emily66@example.com', '_ju2CcIm0wI&', 'Brittany Miller', 1, '+1-864-260-1962x60128', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('kingheather@example.net', '^r)Y0StB#$Ro', 'Bryan Mason', 1, '399.584.5704', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('leslieanderson@example.com', '(+#GvsMrvBO7', 'Amber Arellano', 0, '929.563.9498', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('butlercharlotte@example.com', '2R4+wOU#cy%W', 'Stephanie Velasquez', 1, '(834)286-9955x533', 1, '327575392_736464687761994_8673981857309914369_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('nicholas50@example.net', 'w80c(V6J%oAt', 'Cody Jackson DDS', 1, '966-693-3521x1640', 1, '452613735_1036702941161043_2918307811633307299_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('millerwilliam@example.com', '#5@RWzAx44NU', 'Patrick Walter', 0, '(639)662-8444', 1, '327575392_736464687761994_8673981857309914369_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('loriflowers@example.net', '21EnIg6D&sm5', 'Kaitlyn Lucas', 0, '941.488.7014', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('vanessasanchez@example.org', 'k_1Dy^Frj_9X', 'Thomas Washington', 1, '001-725-236-1917x7090', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('barnesdavid@example.com', 'mr8dLt#ixO@f', 'Brittany Holloway', 1, '830.236.1460x61943', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jasmine70@example.net', 'sbY1S+oVo*3*', 'Cathy Duncan', 1, '+1-420-627-9931x3006', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('tcooper@example.net', 'oT74W&s%N(EK', 'Tiffany Lang', 1, '+1-560-927-1456x298', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('davidwhite@example.org', 'tg76aVkyL$oN', 'Jesus Mercer', 1, '497.971.0410x5058', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('amanda14@example.com', '))2dXCoaChLe', 'Julie Leonard', 0, '339.646.5766x3524', 1, '458692365_1262522218123530_2051358285189062206_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('hatfieldcristina@example.net', '3wjP17yi_10Q', 'Emily Simmons', 0, '(504)809-9936x4229', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('sharon03@example.org', ')IMDKcoZ4+dE', 'Patricia Roman', 1, '001-980-416-7159', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('johnsnyder@example.com', '_jSPcFJMI8WQ', 'Olivia Steele', 0, '(345)694-4472x022', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jeremymorgan@example.org', '9#L3J_Jy&q$n', 'Kenneth Mcguire', 0, '(478)472-1485', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('hollycraig@example.net', 'AWw3Ie6E_*+8', 'Brian Collins', 0, '972-994-1440', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('michael20@example.com', '8pALfg%F&s*o', 'Matthew Wade', 0, '593.786.7140', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('cory59@example.net', 'zdM6o%aOc)2D', 'Mackenzie Jones', 1, '294-642-6559', 1, '458692365_1262522218123530_2051358285189062206_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('kray@example.net', 'Q_rN$Mnw3732', 'John Ramirez', 1, '326.418.7239', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('christine38@example.org', '*3uMzbt8f%TO', 'Ashley Maldonado', 1, '865.438.3411x17495', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('kristymartin@example.net', '^V1Afp(7xLoM', 'Laurie Hanna', 0, '641-709-6776', 1, '452613735_1036702941161043_2918307811633307299_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('morrisray@example.org', '_e5SuT_57DFd', 'Kathryn Bradford', 0, '265-468-6736', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('priscilla89@example.com', 'r_Ny2^Qg0wIc', 'Tiffany Davis', 1, '575-377-6584x2351', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('bjordan@example.net', 'i4zgHqot(P0L', 'Tina Lewis', 0, '+1-277-672-6949x83993', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('paulahernandez@example.com', '05^ER+mv^ciV', 'Timothy Burgess', 1, '(793)988-2103x4059', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('qgould@example.com', 'S3FBr6c3$kV+', 'Paul Snyder', 0, '281.418.0009x9134', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jshaw@example.com', 'fc0btX9$!AkL', 'Nicole Sandoval', 0, '(321)214-7788x3550', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('martinezerin@example.net', 'q986&M7a$n_p', 'Jennifer Gonzales', 0, '9768317128', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('max28@example.org', ')@8hlziu_#TS', 'Melissa Perry', 0, '(715)671-6785x184', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('gwilliams@example.com', '&(8ja^I14hd8', 'Gina Booker', 0, '(836)943-9826', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jonesmegan@example.net', 'T5)gOYYP5BQH', 'Patricia Harris', 1, '732.589.6516x78406', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('rhanson@example.net', 'cTn)9OwWXa^q', 'Cheryl Yates', 1, '(660)823-9264x0632', 1, '458692365_1262522218123530_2051358285189062206_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('lowerycharles@example.com', '(#04Efr^acW)', 'Samantha Jones', 1, '898-895-8635x73894', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('emilygonzales@example.org', '%^(Qt$k$6Tjy', 'Shawn Watkins', 1, '6549923361', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jkelly@example.org', '&0gk@GMjCwbL', 'Mark Gonzales', 0, '+1-580-307-9234', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('kirkpatrick@example.net', 'G3t(6H%gpp5$', 'Dana Moore', 1, '001-661-234-9051x63177', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('erodgers@example.net', 'Na$39S_uM8&D', 'Theodore King', 0, '294.414.3225x752', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('psalinas@example.com', '$3jwpIUi_E#(', 'Margaret Campos', 0, '(792)726-9372', 1, '327575392_736464687761994_8673981857309914369_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('omaddox@example.net', 'LIv(7(FlK&me', 'Jennifer Ewing', 0, '(342)388-9800x74999', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('rebeccaarias@example.net', '&YA1U+ana&6J', 'John Brown DDS', 0, '483.933.6162x2335', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('urobertson@example.com', '1B+sZoF0w73u', 'Phyllis Watkins', 0, '(437)312-8468x7864', 1, '452613735_1036702941161043_2918307811633307299_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('whitesophia@example.net', 'NKqo1P1v$BB9', 'Andrew Johnston', 0, '(564)689-8962', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('thomasbrown@example.org', 'Wk)#z3uE%2Ch', 'Jonathan Gardner', 0, '661-999-2669x43693', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('bduran@example.net', '&3hvr@iS$FL*', 'Paul Hamilton', 1, '(229)298-4717', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('palmeramanda@example.net', 'dc*7QBeaSdaG', 'Julie Mosley', 1, '001-599-778-9808x75976', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('johnlivingston@example.net', '&0L%VQfpLK89', 'Emma Holland', 1, '(609)468-1007', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('morrisonnicole@example.org', '#O#oEagzeV68', 'Kerry Miller', 1, '409-497-7010x471', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('thomasashlee@example.com', 'Qw75dfef!PAY', 'Teresa Warren', 0, '(253)715-7936x11338', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('bradley75@example.com', ')6mFweTS206t', 'Tyler Goodwin', 1, '001-958-963-2298x2310', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('evanselizabeth@example.org', '*f4XvkTS)9s8', 'Jacob Richards', 0, '(308)263-2571x94981', 1, '458692365_1262522218123530_2051358285189062206_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('lopezsandra@example.net', '4It+0QkcvsGe', 'Adriana Fox', 1, '+1-725-748-2355x9420', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('nburns@example.org', 'zt#XqtIi$R3B', 'Howard Smith', 0, '(693)457-9861', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('mparks@example.org', '+&Ny8JSt+%nx', 'Christian Dominguez', 1, '(541)803-4137x5157', 1, '327575392_736464687761994_8673981857309914369_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jimmyking@example.net', 'swUH3_Fdg(81', 'Vincent Combs', 1, '(916)993-9130x1617', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('daniellestewart@example.org', 'u(2s_Lw%4OV^', 'Andrew Parsons', 1, '4005452012', 1, '458692365_1262522218123530_2051358285189062206_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('kpierce@example.com', 'M$SnJ7HzVVe&', 'Eric Brown', 0, '301.276.5754x08794', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('michelle68@example.com', 'Ad9)9Soz4(Xo', 'Clinton Pope', 1, '2672431327', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('kimberly31@example.net', 'b8A!heSHIWtg', 'Michael Fischer', 1, '445-457-0748x40176', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('loririce@example.net', '!FgMvrCe2QPN', 'Jay Gilbert', 1, '+1-475-782-6894x9663', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('hannahhunt@example.net', 'Q(5l$A!f!P0#', 'Jessica Harris', 0, '583.988.4412x6171', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('teresa53@example.net', '$JsUbt7cVp7^', 'James Rowland', 1, '001-490-827-4855x1511', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('catherine83@example.org', 'M!H6nEKylU9+', 'Joseph Davis', 1, '001-684-616-5972x36637', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('burnschristina@example.org', '(0R2B8o**uRA', 'Nathan Williams', 0, '001-703-243-3546x81817', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('tferrell@example.org', ')thDreuc5vQf', 'James Gonzalez', 1, '001-844-706-4770x7010', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('cproctor@example.org', '44AOPum$#MI#', 'Tara Lopez', 0, '682-890-9648x926', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('harrisjacqueline@example.org', '7cn9AMOuu(56', 'Jason Curtis', 0, '961.206.1906x378', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('tina38@example.org', '0#nUPgiH@WZF', 'Rhonda Murray', 0, '544.536.2848', 1, '452613735_1036702941161043_2918307811633307299_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('edward20@example.com', '&5%4MyjfoYp1', 'John Alvarado', 1, '+1-576-664-2587x61199', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('pkent@example.net', '0lZbrpnZ)PNg', 'Lucas Henry', 0, '(341)808-1412x0851', 1, '452613735_1036702941161043_2918307811633307299_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('vevans@example.com', 'w3jNBMfc@*1H', 'Tracy Phelps', 0, '343-663-6236x8642', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('clarkkenneth@example.com', 'zcBhD(qP^0kL', 'James Sanchez', 0, '(384)233-3866x7009', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('colemanmiguel@example.com', '^H9#%Ef&)0@I', 'Peggy Hall', 1, '001-426-875-5690x344', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('diana84@example.org', '@M0JI9PiTfj+', 'Joan Rogers', 1, '001-935-594-9020x5386', 1, '452613735_1036702941161043_2918307811633307299_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('cassandrachen@example.org', '^6lvTSng^2*h', 'Amber Hill', 1, '712.405.6520', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('johnsonjustin@example.org', '!p5FP9d1M*7S', 'David Oconnor', 0, '627-954-5352', 1, '452613735_1036702941161043_2918307811633307299_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('aaron15@example.org', 'yf7+Lfql%2!*', 'Diana Thomas', 1, '(323)646-4158x74615', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('kennethlee@example.com', 'Z#)7Rn5JR&t_', 'Tammy Robinson', 1, '(994)957-8925', 1, '452613735_1036702941161043_2918307811633307299_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('zoesharp@example.com', '!RsiYQg%*3UE', 'Julia Hardy', 0, '001-666-969-0745', 1, '458692365_1262522218123530_2051358285189062206_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('marilyn98@example.com', 'Jz5XGupO(_VA', 'Jaime Obrien', 0, '+1-968-460-9996', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('mirandamathews@example.net', '+IkoN$C9q6VM', 'Joseph White', 1, '335-509-1713', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('npratt@example.net', 'IW)p@2JbXat5', 'Rebecca Parker', 0, '945-678-7287', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('chadlevy@example.net', 'enJ*+9Mbz391', 'Stephanie Smith', 0, '964-275-1488', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('connerjonathan@example.org', 'Wo92IeBu@*M2', 'Sarah Brewer', 0, '+1-821-669-3031', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('mariajones@example.net', 'l(RbOhZs%C0E', 'Clinton Jones', 0, '(698)954-4335', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('qowens@example.org', 'pL3CEebe^mfU', 'Julia Fowler', 1, '832.350.7818', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jillian11@example.org', '39EVjDus*0vb', 'Renee Morris', 1, '915.410.4280x20615', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('boylematthew@example.com', '%aEl1XlZ4ZY)', 'Isaiah Cox', 1, '001-919-890-3204x20279', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('ncurry@example.net', 'B&gS2Sk1#(Z)', 'Tracy Mendoza', 0, '001-439-914-9627', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jenniferknight@example.com', 'M1ANOe+$n^11', 'Alison Wise', 1, '001-721-434-8156x40351', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('john86@example.net', '&2gsmP(dkdJp', 'Lauren Long', 1, '+1-454-238-9407', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('camachorobert@example.org', 'CGLAy#Ps+3(8', 'Susan Lane', 0, '001-518-769-3928', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('patricia46@example.com', 'IO^5MjHBOp!$', 'Christopher Ramirez', 0, '(505)747-3830x550', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('lisa72@example.org', '!90BJ8Au&@Vl', 'Joshua Potter', 0, '001-282-500-7277x94873', 1, '458692365_1262522218123530_2051358285189062206_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('pcallahan@example.net', 'X_SY9Z(uFx8J', 'Rebecca Holden', 0, '+1-308-921-8151x542', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('christopher16@example.net', 'l^TYqedS)8*Q', 'Andrew Barber', 0, '224.717.6950x4064', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('fparker@example.com', '^0ZrV1CnsvhJ', 'Tina Stewart', 0, '001-298-471-5401x466', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('stephenleonard@example.org', 'q2W5Wb76+Z9c', 'Renee Russell', 0, '201.629.8276x2512', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('sheltongabrielle@example.net', 'uXf#6NxZPo2@', 'Kathryn Gross DDS', 0, '001-237-209-1771x374', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('scott90@example.com', '^BkDJ$RxH0zq', 'Dr. Carrie Carter DVM', 0, '(326)821-0441x65430', 1, '452613735_1036702941161043_2918307811633307299_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('wpotter@example.com', 'jAXDm0Yjtj+#', 'Dawn Silva', 1, '001-592-857-0555x7957', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('calvin61@example.net', 'zvO2aKA^D*@p', 'Christina Poole', 1, '+1-423-254-9333', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('shunt@example.net', ')Y_38s5v4dQu', 'Kristin Wallace', 0, '313-478-2389', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('clarkloretta@example.net', 'shUFAbdZE^$0', 'Matthew Gonzalez', 0, '(597)668-9124x9416', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('tammywheeler@example.org', '@6Y9$@z&#T2t', 'John Campos', 0, '(255)329-2495x8181', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('hahndeborah@example.com', '8%BEif1Y(1av', 'Larry Clark', 0, '895-445-2804x229', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('brettpatel@example.com', '_$LMsf@euh7N', 'Monica Kelly', 1, '4047917755', 1, '452613735_1036702941161043_2918307811633307299_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('alexandra18@example.net', '0roE2HctU^Cx', 'Denise Bolton', 0, '(746)453-7339x5377', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('hlutz@example.net', 'Jk*N$3pJ)_0C', 'Kathleen Hayes', 0, '(695)989-5286', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('steelebenjamin@example.org', '0wDVieok4J3!', 'Tom Edwards', 1, '564.530.8797x572', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('kellycharles@example.net', '*NQ$@gjrO1KG', 'Jessica Brooks', 0, '808.584.8857', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('banksjennifer@example.com', 'R39Vu9E3%!1A', 'Jessica Craig', 0, '617-637-8785', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('alexandra58@example.net', '%2fvFdWtlmV^', 'Nicole Williams', 0, '204-685-6814x4167', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jameswoods@example.com', '_3TiuPmK8Y5W', 'Christopher Wilson', 0, '852-333-6078', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('wsmith@example.org', '&nHAX2Ie7gEU', 'Mr. Peter Mahoney', 1, '+1-874-524-8720x35671', 1, '452613735_1036702941161043_2918307811633307299_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('kevin64@example.com', '*%bYxIq13Cv#', 'Shannon Hess', 0, '001-489-796-1727x84773', 1, '452613735_1036702941161043_2918307811633307299_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('walter21@example.org', 'C*LMTRWm@$5J', 'Barbara Walker', 1, '643-346-8688', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jenniferguzman@example.com', 'vZM2VWxOf@&7', 'Danielle Medina', 1, '4493591443', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('kingjohn@example.com', 'aD6wc6(r%&OW', 'George Graham', 1, '001-785-702-3342x086', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('shernandez@example.net', 'D29vbfCh!6h1', 'Alexander Garner', 1, '+1-643-319-7516x688', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('tyler05@example.com', 'w+LRE*&kTo24', 'Alexandra Garcia', 0, '001-607-550-5224x94376', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('drichardson@example.net', '+kFaFqTuXS91', 'Melanie Krause', 0, '4167942891', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('maryglass@example.com', '^%6VxzZqdvBY', 'Bradley Price', 0, '(662)847-9496', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jared72@example.org', '7yd71Ra!j%bS', 'Deborah Johns', 0, '(461)334-0751', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('erikapaul@example.com', 'ZiG0^o_h@D4R', 'Russell Campbell', 1, '6107448490', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('ohill@example.org', 'rkxBEBp9T2V(', 'Nicole Wilson', 0, '001-264-787-2485x73923', 1, '452613735_1036702941161043_2918307811633307299_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('frederickreynolds@example.com', 'C$W@anXbm3UH', 'Edward Jones', 1, '799-474-7639x3537', 1, '458692365_1262522218123530_2051358285189062206_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('natasha62@example.org', 'Ntl9XR%ixL@K', 'Holly Hughes MD', 0, '001-756-238-9775x219', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('lowens@example.net', '*ByJKWJe6HgN', 'Sean Willis', 1, '001-971-537-5470', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('davidsondavid@example.com', 'Eh(4PpE5f#$3', 'John Everett', 1, '(702)919-2708', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('angela35@example.com', '*jpYLjOmbMK9', 'Mr. Lucas Stokes MD', 1, '001-829-274-7134x61470', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('usmith@example.com', 'P8(Gq9hn&aUS', 'Mark Fowler', 1, '(773)340-6424', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('angelacantrell@example.net', '4_K74FthwokU', 'Lindsay Young', 0, '001-818-408-9302', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('danielhart@example.org', 'N_353Nei$03Y', 'Robert Walker', 0, '544.994.0229', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jallen@example.net', '+5ODt1uY*8Of', 'Christopher Lewis', 1, '803-256-8970', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('anthonyhansen@example.com', 'J&ZoBo0pqZ8m', 'Linda Lara', 0, '(253)837-6068', 1, '327575392_736464687761994_8673981857309914369_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('knightcarrie@example.com', 'RrU)*b4L&o0k', 'Xavier Anderson', 1, '+1-477-674-3463x1300', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('smithkeith@example.net', 'i54ke(d1koP^', 'Alexis Gibson', 1, '(437)327-5150x3543', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('xlandry@example.org', '8tfA4i&9&7S9', 'Teresa Brown', 0, '770.284.3913', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('eturner@example.net', 'k2V@Eh7p)25O', 'Mrs. Leah Kemp DDS', 0, '001-444-757-2946x08293', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('melissa08@example.net', '#AoxTIc$%6IN', 'Kim Pierce', 1, '5764526167', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('kathryn74@example.org', '_k(#gDs)47Gh', 'David Mosley', 0, '(209)483-4412x85241', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('luiscox@example.org', 'Q*LgW%f#a6)6', 'Brian White', 0, '(326)817-7770x089', 1, '327575392_736464687761994_8673981857309914369_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('ashleyharper@example.net', 'uNS0VDVxn)ip', 'Jonathan Cunningham', 1, '+1-554-545-7954x5419', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('longpaul@example.com', 's3o2i3C8+GXV', 'Michael Murphy', 1, '(407)843-7456x88735', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('atanner@example.org', 'L&(5z3Gy9c92', 'Anna Krause', 1, '(240)968-8302', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('josesimmons@example.org', '@%mflECxbi7L', 'David Snyder', 1, '803-440-8191x08031', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jenniferthomas@example.net', 'w+IuX_umbr5b', 'Albert Morse', 1, '+1-261-611-9893x2701', 1, '452613735_1036702941161043_2918307811633307299_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('melissavaldez@example.org', '*3dny91H!lkG', 'Morgan Hayes', 0, '+1-659-595-2810x108', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('rhondafisher@example.org', 'k6iS1jLx9UG^', 'Kimberly Smith', 0, '(968)558-4423', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('valdezsally@example.com', '_%5KIy9XaJS%', 'Donna Palmer', 0, '523.717.8646x00089', 1, '327575392_736464687761994_8673981857309914369_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('rachelgarcia@example.org', 'a*QkzCEm$fb0', 'Audrey Padilla', 0, '535-679-0901x1248', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('kathleengibson@example.org', ')G(5(DeZxSR4', 'Randall Goodman', 1, '4795793371', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('adrian99@example.net', '#1#+jMdfRoJT', 'Jeremy Lyons', 1, '(916)869-1788x37681', 1, '327575392_736464687761994_8673981857309914369_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('ydavis@example.com', '0ulIPauf_6ur', 'Linda Hunt', 0, '6752426464', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('lindascott@example.com', 'q7Yn6sux)bPE', 'Christopher Reed', 1, '713.761.3371x1539', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('robert65@example.org', '87B@K*0noTVy', 'Angel Wheeler', 1, '581-420-3149', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('gbraun@example.net', 'k$2Aci%i!xnS', 'Nathan Johnson', 1, '973-614-1894x28715', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('ashley81@example.com', '@56L$6wxX#2N', 'Paul May', 0, '610.369.2311x9820', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('gregorywilliams@example.com', 'Wm!HOkv$DXU8', 'Curtis Kline', 1, '505.544.7078', 1, '452613735_1036702941161043_2918307811633307299_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('bucknancy@example.org', '_xiCvL!ug3F1', 'Steve Sanford', 1, '299-401-2033x8411', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('whitesteven@example.com', 'I00PPdtV$_U9', 'Michelle Terry', 0, '515-580-6584', 1, '327575392_736464687761994_8673981857309914369_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('apriledwards@example.net', 'u8Hkooip_bMr', 'Allen Jones', 0, '6715266638', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jeffersonchelsea@example.com', 'S5+JsIMW+eZe', 'Chad Garcia', 0, '705.492.5207', 1, '452613735_1036702941161043_2918307811633307299_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('fclark@example.net', '7F7JheXv7@C+', 'Joseph Reyes', 0, '512.629.8642x60718', 1, '458692365_1262522218123530_2051358285189062206_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('robertprice@example.com', '6rUHqimk#Mp4', 'Jeffrey Daniel', 0, '527-900-4471x3462', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('pamelaanderson@example.org', 'F1&rOHFwfo53', 'Julie Carter', 0, '(962)877-3095x8412', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('john14@example.com', '*Zp0SORi11Q#', 'Caleb Horne', 0, '823-837-0517x07856', 1, '452613735_1036702941161043_2918307811633307299_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('amandarobertson@example.net', 'Q7Mm(scR&A1o', 'Howard Baker', 0, '478-749-2133x8942', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('estradamonica@example.net', '^5dReqkYZ5m%', 'Terry Anderson', 0, '7274183256', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('victoria97@example.net', 'EtH!vysjd^7G', 'Christopher Marshall', 1, '(211)375-6506', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('tmaldonado@example.org', 'txXn4Q4u7@$I', 'Jennifer Johnson', 0, '+1-642-301-7986x43683', 1, '327575392_736464687761994_8673981857309914369_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('thaley@example.com', 'sr02ncLv%wON', 'Brad Phillips', 1, '612-794-6424x3443', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('christopherroberts@example.net', '^k*MgHtj)8kq', 'Mrs. Cynthia Le', 0, '835-538-1020x6752', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('dross@example.net', '+hN4FoA1n0lZ', 'Cory Meyers', 1, '001-629-914-0836x47270', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('margaretwilson@example.com', 'J9Jomuam#AE^', 'Mariah Jefferson', 1, '517.388.2579x777', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('molinabrianna@example.com', '(H7DNfFWzM2O', 'Kelly Williamson', 1, '(890)674-9260x0778', 1, '327575392_736464687761994_8673981857309914369_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('singletonkyle@example.org', '(Q*)TdGn$PC4', 'Kim Schultz', 1, '(259)615-9830', 1, '458692365_1262522218123530_2051358285189062206_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('craigsandra@example.net', '3&#Aq8rdTN7J', 'Crystal Martin', 0, '227.431.2523', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('donna49@example.org', ')!LAYzjgr)2h', 'Jessica Mahoney', 0, '001-284-687-1461x461', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('briankoch@example.com', '9$Z49xkG+sgE', 'Danielle Webb', 1, '245.497.2877', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('fernandezroberto@example.org', '_Z0Nfy2x^#Tw', 'Christopher Morrison', 1, '+1-797-227-0141x2155', 1, '452613735_1036702941161043_2918307811633307299_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('diana44@example.net', '@6m^sTSShs4$', 'Alexa Owens', 1, '+1-951-815-2377x3763', 1, '458692365_1262522218123530_2051358285189062206_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('kthomas@example.net', '9)7vZSnubc0y', 'Antonio Daniels', 0, '001-703-397-8821x816', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('anthonyhoffman@example.org', 's)@rRNrMUc%5', 'Tammy Diaz', 0, '892-323-2508x8719', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jennifer05@example.org', 'c)v2GPamK#t6', 'John Wagner', 0, '829.887.5821x574', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('andrewsrobert@example.net', '2l09JJDI%$dS', 'Nathan Ellis', 1, '+1-453-638-4966x2688', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('valeriespencer@example.com', 'X2fQyfoTzgc!', 'Kimberly Lopez', 0, '001-421-591-3119x012', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('joannasmith@example.org', 'Cq2JeW1^!6E^', 'Tami Roman', 0, '001-746-783-5304', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('mannashley@example.net', 'Y&f7imHiokNi', 'Tara Palmer', 1, '638-571-5017', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('youngheather@example.org', 'R4Ea!if2Gk&H', 'Ashley Griffin', 0, '8419814240', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('lawrence06@example.org', 'H_fuJzPfoV3s', 'Richard Cummings', 0, '269.622.4767', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('gutierrezralph@example.com', 'ZO_^iIfLt1%L', 'Sharon Chavez', 0, '801-834-2085', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('thomascohen@example.org', 't9t3qab%@(bJ', 'Angela Mccarthy', 1, '+1-968-549-4349x64710', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('coxhector@example.com', 's!9PgIwD_@Im', 'Shannon Butler', 0, '(802)684-3123', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('pblake@example.org', '@@F75qvZK3bP', 'Jennifer Rogers', 1, '(352)713-2027x2257', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('nicholasrodriguez@example.net', 'TDT45juzb__Z', 'Robert Simon', 0, '001-316-699-2468x437', 1, '452613735_1036702941161043_2918307811633307299_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('anthony04@example.com', 'bxXJSlKgv^0x', 'Scott Pierce', 0, '001-745-587-5232x217', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('fanderson@example.org', '19c3lVT1(mFE', 'Donna Kelley', 0, '854-921-8631x90091', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('ggilbert@example.com', 'U^t(0ol$(L7N', 'Sierra Sanchez', 1, '(493)570-8303x373', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('larsonjose@example.org', '&aXC^uGP6iTN', 'John Tate', 1, '833-545-1026x6540', 1, '452613735_1036702941161043_2918307811633307299_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('heather70@example.org', 'xW5jJ+sl7_&!', 'Brittany Campos', 1, '687-246-4445x3765', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('ghouston@example.com', 'M%TSMz^Z#79v', 'Mia Griffith', 0, '933.619.2076', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('staceyprice@example.net', 'a&CFh@8a%o0T', 'Richard Simmons', 0, '9658936978', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('nhernandez@example.net', 'd#dxh!k71D8D', 'Thomas Clark', 0, '281-393-8498', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('glennreyes@example.net', '9p5Yc3Sv0*N_', 'Mary Lee', 0, '001-314-328-3276x47476', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('klee@example.com', 'Sa128Ohn_Y*U', 'Kathryn Gilbert', 1, '(785)812-9586', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('johnsonrebekah@example.net', '8Yfi#95(rAP#', 'Joseph Booth', 0, '001-415-827-1456x02886', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('richard78@example.com', '_I3wPtyb!)nA', 'Keith Wilson', 0, '001-636-840-2505', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jacqueline90@example.com', 'B+9zm_wtPQr7', 'Allison Wilson', 0, '830-427-1078x4985', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('hernandezamy@example.org', '(U1YQ2xy$V%v', 'Eugene Horton', 1, '001-510-815-2858x08903', 1, '458692365_1262522218123530_2051358285189062206_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('joseph36@example.com', 'rCEKzunp@*5L', 'Kristine Hayes', 0, '2367087671', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('ugarrett@example.com', 'U6OqG33q#X_I', 'Jordan Bennett', 1, '930-722-9528x201', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('haneyashley@example.net', '*^EUnm3d6(2l', 'Edward Walker', 0, '891-372-2148x58334', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('wesley00@example.net', '(9JtJUHxu%ab', 'Felicia Park', 1, '996-537-4288', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('whiterichard@example.net', 'af1$IMri^x8V', 'Brandi Fisher', 1, '001-274-320-0964x6795', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('imills@example.com', '2MqUrjPr1)4)', 'Patricia Hall', 0, '312-884-6306', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('lori88@example.org', '@0mJZY+mt@ET', 'Barbara Cole', 0, '234.709.3628', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('robertsalan@example.net', '$aFFCVeN)yo7', 'Beth Murphy', 0, '(788)301-5846', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('sarahdavis@example.net', 'y+6+HUizxQuD', 'Lisa Russell', 1, '582.812.2661x30106', 1, '452613735_1036702941161043_2918307811633307299_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('nicholas42@example.org', 'HSyes7Ojwn_+', 'Christopher Tucker', 0, '001-658-773-5974x877', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('masseypatrick@example.net', 'n8!LIFgmYfJ2', 'Bobby Ellison', 1, '924.483.0724', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('urichardson@example.net', '8#*!DBRlGNl3', 'Jonathan Gonzalez', 1, '994-887-3153', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('patriciahill@example.net', ')ZIEDwS28(0#', 'James Ross', 0, '+1-668-536-0880x927', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('gardnerrachel@example.com', '(RXXJjm!@9Yr', 'Holly Miller', 0, '(266)342-3356', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('heather36@example.net', 'N(eB&CQfZK2o', 'James Quinn', 0, '950.725.3199', 1, '452613735_1036702941161043_2918307811633307299_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('donna49@example.net', '_1yC*&Rt_aj!', 'Emily Munoz', 1, '326-895-8134', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('andrewbrown@example.com', 'kbfNRpb3@5XN', 'Tracy Smith', 0, '(831)448-9293x5451', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('ecline@example.net', '^rMMt^sD$49F', 'April Thompson', 1, '001-540-441-4852', 1, '452613735_1036702941161043_2918307811633307299_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('sharris@example.net', '*aejWUi+A3&S', 'Julie Hall', 0, '725.419.6800x192', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('sydney33@example.net', '+Vu5Fdco$b(2', 'Robert Sheppard', 0, '+1-506-771-3244x9383', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('pdonovan@example.org', '0^eSb)29)csB', 'Holly Stewart', 1, '+1-644-773-8773', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('lisa97@example.org', '1a333Lycy%!x', 'Spencer Cooper', 1, '921-393-4803x6668', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('ytravis@example.net', '&MO5v5fK8&yW', 'Christy Lam', 1, '929-408-7652', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('melissasanchez@example.org', '0GfxKnJ7(k^a', 'Ethan Lopez', 0, '(779)457-5589x744', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('kingpatrick@example.com', '^6RIDAeVrs63', 'Jimmy Collins', 1, '5087468076', 1, '327575392_736464687761994_8673981857309914369_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('barry29@example.com', '!gJT@gyy(4n2', 'Leslie Harris', 0, '745.371.5223x65569', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('nicholas72@example.com', 'A7RAEu1q_rm*', 'Christina Johnson', 1, '001-464-469-7299x48849', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('hcarson@example.net', '^g137K5s3Hh(', 'William Schroeder', 1, '+1-278-200-0776', 1, '458692365_1262522218123530_2051358285189062206_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('amandamorgan@example.net', 'l*#jAkQ_MN07', 'Donna Lopez', 1, '(246)869-5800', 1, '327575392_736464687761994_8673981857309914369_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('mking@example.com', '+gy3XdqY&b%(', 'Autumn Deleon', 0, '874-462-7591x17447', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('zlopez@example.com', 'x*I@)ujl6Rlk', 'Stephen Medina', 1, '271.512.3247x5686', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('bwright@example.org', '%h5adQzlH!4G', 'Jason Hardy', 1, '+1-654-504-9442x7539', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('robinsonmartin@example.com', 'j@2aLfUcLf@a', 'Alexandra Allen', 0, '973-761-8462x693', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('garciadamon@example.net', '+JKRkjc1*8CJ', 'Kimberly Fitzpatrick', 1, '001-841-590-7791x68724', 1, '452613735_1036702941161043_2918307811633307299_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('davidfoster@example.net', '!Wr$Zqbo+9M2', 'William Kelly', 1, '(810)557-9514x1078', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('vmason@example.net', 'Z&e7d4Uvmvpo', 'Ernest Smith', 1, '874-515-7375x446', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('baileydebra@example.org', '8_Ri0Ivnrv&6', 'Mary Carter', 0, '744.516.1636x2023', 1, '327575392_736464687761994_8673981857309914369_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('hugheslinda@example.net', 'cb1Lx4LN+*@A', 'Tom Garner', 1, '908.315.7221', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('thomas29@example.net', '@!E%iq6q!39*', 'Michael Kline', 0, '778.266.3273x353', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jeremyhawkins@example.net', '7_+5QT0B*xzt', 'David Arnold', 0, '317.973.1785', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('kenneth08@example.com', 'AB6GOab^%jRt', 'Stephanie Watson', 0, '321-425-2242', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('rogersamber@example.org', 'h3C(*zf^_sRa', 'Lisa Peterson', 1, '957-360-0195', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('eclark@example.net', '$A#IKdgLt9Gs', 'Thomas Campos', 1, '872-233-4153x28683', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('ojohnson@example.org', 'hTN@*bWM8c)i', 'Gregory Brewer', 0, '(696)551-7214x6808', 1, '458692365_1262522218123530_2051358285189062206_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('amanda14@example.org', ')tAjDkQSz7*l', 'Danielle Harris', 0, '001-631-910-7705', 1, '458692365_1262522218123530_2051358285189062206_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('ipeterson@example.net', 'IxH#oZr4dPX7', 'Brian Anderson', 0, '942.476.4857', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('anthonyfields@example.org', '!Q7N)Ewm&q5%', 'Nicole Barton', 1, '+1-536-819-4705x9392', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('ashleyharris@example.net', '#x7jt9qXkvYO', 'Keith Cook', 0, '001-784-360-4761x04737', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('royshannon@example.net', '8u+y@2Rge8PA', 'John Miller', 0, '470.900.6711x83675', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('nelsonmichael@example.net', '_@d6QzJfW9Ma', 'Mrs. Jasmin Stewart DDS', 0, '246.506.7761', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('gabrielle40@example.org', '*L7PvvkT4StO', 'Robert Miller MD', 1, '360.986.6004x1170', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('vwarren@example.org', 'v61@qs5(V4AB', 'Terry Barry', 0, '001-227-329-4411x359', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('mwhitaker@example.com', '*s6G^KQy0(ei', 'Stephen Brown', 0, '333-463-9651x268', 1, '458692365_1262522218123530_2051358285189062206_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('kennethharrison@example.net', '&9ERw(Ysk_JS', 'Stephanie Salazar', 1, '+1-243-930-7444x52689', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('scottodom@example.com', '_w8Pp)ze^e&M', 'Timothy Flores', 0, '(916)613-8430x743', 1, '327575392_736464687761994_8673981857309914369_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('daniel40@example.net', 'Wu(^i@UE@9QS', 'Kelly Ortiz', 1, '001-460-705-6544x68778', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('angelamartin@example.org', 'r8PAlt)d^U+n', 'Lisa Hobbs', 0, '702-630-4031', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('thall@example.org', '#6(5^L)k(HnP', 'Jennifer Gentry', 1, '001-706-987-3972x3021', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('royhurley@example.net', 'gt45*TvTotn^', 'Christopher Williams', 1, '560-928-8933', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('tperez@example.org', 'tN2ORo7c)0B4', 'Jill Meyer', 1, '+1-675-824-2868x962', 1, '327575392_736464687761994_8673981857309914369_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('lanejeffrey@example.net', '&Bv3QUmg#Pmb', 'John Brown', 1, '001-627-554-3060x166', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('martineztravis@example.org', '@R3#DeA&!p56', 'William Hurley', 0, '001-864-262-0608x46589', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('robert03@example.org', '%0mtrn7OEt3Q', 'Ronald Bernard', 0, '001-352-505-4344', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('lisa89@example.com', '_1szwx5jMryF', 'Zachary Kramer', 0, '2686159091', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('mccarthyjoy@example.net', '5KbW)&Nm^J)E', 'Dale Carroll', 1, '509-543-1333', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('erivera@example.com', 'Y&7Pe9YYbJiH', 'Michael Saunders', 0, '+1-623-419-3205', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('dmckenzie@example.net', 'x#!8jI%GNzXM', 'Amy Rosales', 1, '+1-481-845-7324x688', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('ccontreras@example.net', 'YTF4nEtfJ_8J', 'Richard Singleton', 0, '(523)683-0512', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('william58@example.net', '@1ow3mDfZZF2', 'Jason Scott DVM', 0, '+1-675-865-9588x0615', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('lstone@example.com', '0@@FRhU8)E7U', 'Patrick Davis', 1, '(374)683-7755', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('thomaspayne@example.net', '(_6*deDn6%4y', 'Jonathan Gray', 1, '547-423-8602x00599', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('gina98@example.net', 'W4bWsMsk@ou$', 'Gerald Carpenter', 0, '945.977.7504x317', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('murphymichael@example.org', '^1CXoEe1y8JS', 'Kaitlyn Noble', 0, '404.238.7400', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('robertbarnett@example.org', 'f(8w0PqiBu&H', 'Ann Estes', 0, '840.302.3524', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('johnsonlaura@example.org', '7o@4B)*Y%$2Z', 'Charles Williams', 1, '490.675.0135x2630', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('robertslynn@example.org', 'l&7CX0l#6t3)', 'Suzanne Herrera', 1, '508-833-0839x4671', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('tracy02@example.com', 'as1(uwYt(9+H', 'Kyle Harris', 0, '(327)665-7888x609', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('valeriehenry@example.org', '%8RZuY9dtsJR', 'Thomas Terry', 0, '998-207-0515x6917', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('catherine38@example.net', '+Giw871*s4X6', 'Anthony Bennett', 0, '001-420-920-6676x557', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('yolandakim@example.com', '!$w$oFJvT4Rt', 'Mark Ramos', 0, '+1-896-278-5143', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('julie78@example.org', 'qq3S^ZWv9(ZR', 'Victoria Bell', 1, '(642)730-3509x2679', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('kaitlynmartin@example.org', '5a%xE%nX53n5', 'Henry Williams', 1, '(574)791-1069', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jonescaleb@example.net', '_Q39NXjr(PF8', 'Felicia Cunningham', 1, '+1-993-813-9422', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('davidbarrera@example.com', '#v$7T3PeWv^N', 'Mr. Harold Medina MD', 1, '(854)677-3632x136', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jeffrey85@example.net', 'On!UU#Kv^6Ak', 'Tamara Ray', 1, '+1-760-295-4646x91014', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('neilwallace@example.org', 'z&7G8dxF&s%8', 'Lisa Edwards', 0, '979-910-0048x311', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jennifer72@example.net', 'k*_HNVVj&o7I', 'Kayla Meyers', 1, '474-857-9266x674', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('anthony89@example.org', 'o5ExV^t0+zS!', 'Brett Bailey', 0, '001-763-450-9445x570', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('vhodges@example.org', 'NYPxdDyk)*1l', 'Jesus Abbott', 1, '+1-511-613-1026x48655', 1, '458692365_1262522218123530_2051358285189062206_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('randall49@example.com', '(oy(veOaR6It', 'Angela Marshall', 1, '(844)901-2551x07157', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('ykelly@example.org', '+1Z$5en9uZWw', 'Mr. Dennis Smith', 0, '504.547.9396', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('kelsey83@example.net', 'v9x$!U2vgmbQ', 'Benjamin Parker', 0, '001-870-422-0501x37295', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('shawnhowell@example.com', ')6nFTyn6Ly#*', 'Marcus Hudson', 0, '001-808-501-0911', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('wnoble@example.org', '^A2kiYzlB+cr', 'Julie Flores', 0, '001-920-690-8714x72553', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('gbean@example.net', '7AIe*Ei5!I5o', 'James Hernandez', 0, '+1-580-563-2151', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('lisa02@example.org', 'a(ojLbmZN%Y5', 'Sarah Hopkins', 1, '+1-244-862-4897', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('henry84@example.com', 'c)UABAq#%3l4', 'Lori Delacruz', 0, '501.896.8740x496', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('marshmikayla@example.org', 'iV9HO+e#i(8m', 'Mark Johnson II', 1, '297-737-4903x35523', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('fosterjohn@example.net', 'gt#sUAGhi#29', 'Shelley Adams', 1, '776-541-7508', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('qcarlson@example.org', 'e6GEP@Ykol+4', 'Anthony Walters', 0, '(393)861-0651', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('perryadrian@example.net', '84UG7hl7*3PG', 'Mrs. Courtney Wilson', 1, '001-845-570-9647', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('ybrown@example.org', '%h!CTnvrHq7Z', 'Brooke Myers', 0, '266-986-4373x946', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('morrisrobin@example.org', 'L(df6FLfXRz+', 'Phyllis Duffy', 0, '+1-623-382-5066x06479', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jmata@example.net', '46R5ayKm#XUy', 'Angela Delacruz', 0, '+1-951-783-9910x698', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('mooresandra@example.org', '^LYSDJUb#5aZ', 'Michael Burke DDS', 1, '4272228099', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jimmy11@example.net', '#itR_vDrJo8b', 'Maria Johnson', 1, '(789)876-6852', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('hinesjonathan@example.net', 'boTXm9Ho*6g6', 'Shawna Watson', 0, '304-761-1191x60492', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('sancheznicholas@example.org', 'H%92ptG5(uCM', 'Anna Peterson', 1, '328.424.6815x38277', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('williamboyd@example.net', 'B(CMLncuN^7F', 'Alicia Allen', 0, '3158684489', 1, '452613735_1036702941161043_2918307811633307299_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('mitchellsarah@example.net', 'zrcTUKSp#a8W', 'Richard Flores', 1, '+1-402-410-4756x2771', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('victoria17@example.com', 'Vs45EBlwI(ap', 'Cynthia Walker', 1, '(397)705-1700', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('armstrongalexandra@example.net', 'pu6%erqoo%YQ', 'Stephanie James', 1, '(633)461-8159', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('rowlandrachael@example.net', '%L43PrYhUupq', 'Joseph Jimenez', 0, '6576913410', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('cynthiarandolph@example.com', 'POAj8uZw&54t', 'Christine Moore', 1, '876.898.9324x80185', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('salinassavannah@example.com', '^3LFBjiYf3p7', 'Marvin Patel', 0, '+1-227-682-7023x865', 1, '458692365_1262522218123530_2051358285189062206_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('bmitchell@example.com', 'RvmMSdYe^^_2', 'Adam Navarro', 1, '001-701-403-1418', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('robertvillanueva@example.net', 'c(78VuKHdpOW', 'Ashley Brown', 0, '8767628853', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('gwalsh@example.net', '#6%agfuOvs4M', 'Emily Patton', 1, '+1-255-377-7279x061', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('mccannronald@example.com', '^BabpLOpV5Fl', 'Marcus Pierce', 0, '446-864-6047x43695', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('hadams@example.net', 'DhSo6X%Go^R0', 'William Kirby', 0, '+1-322-655-9482x22049', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('sandovaljordan@example.org', 'O6Cny#Ta*8JA', 'Angelica Howard', 0, '766.968.6031x4366', 1, '458692365_1262522218123530_2051358285189062206_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('uschneider@example.com', 'NQZvGekj_5UO', 'Michelle Pham', 0, '(412)533-5396x569', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('lucas74@example.net', 'Ucx$1P#a!(70', 'Joseph Sanders', 1, '854-709-8482x49442', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('collinsjenna@example.net', 'L7Fn7*DTuBA&', 'John Taylor', 0, '660-452-6554x34953', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('solismark@example.net', '9PHJ_f$a#dOL', 'Andrew Johnson', 0, '621.297.4954x29240', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('roykrystal@example.com', 'M!3M)Ddxjc5T', 'Shelby Douglas', 0, '001-391-958-6071x401', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('matthew85@example.com', '8rQi8!Bnz#Ar', 'Wesley Garcia', 0, '+1-390-214-7716x94152', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('tylersanders@example.org', '#drX3bHEhk02', 'Brett Burns', 0, '559-464-5762x361', 1, '452613735_1036702941161043_2918307811633307299_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('ethangreen@example.org', 'Y9wtZtBB&JIO', 'Hannah Vasquez', 0, '001-252-485-6858', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jeff12@example.org', '^8F(YuVR6W$i', 'Jennifer Graves', 1, '839.853.7891', 1, '327575392_736464687761994_8673981857309914369_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('amalone@example.net', '@oOUaogkDj3O', 'Derek Burns', 0, '691-731-1794', 1, '327575392_736464687761994_8673981857309914369_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('edwardsmark@example.com', 'QY)((YYk(6ze', 'Javier Johnson', 1, '240.279.4178', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('zfrank@example.com', '(0auIT2a8uR3', 'Kelsey Nguyen', 1, '(592)520-5178', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('hernandezbrendan@example.net', 'y*2o7+SpnN4@', 'Roberto Collins', 1, '+1-404-546-1236x625', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('ericrogers@example.net', '+V@UrE0r9t9H', 'Troy Hopkins', 1, '242.245.8521x46601', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('mark74@example.com', '18^3@sPq#@th', 'Jenna Lindsey', 0, '(316)881-2404x00964', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('yfernandez@example.net', '(tN7Nvqb*87K', 'Melissa Carroll', 1, '696.435.0289', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('hmelton@example.com', 'XTr#Q9StmxyG', 'Christine Mckinney', 1, '229-673-5416x7914', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('millerkelly@example.net', 'h%!HbkqC#C6W', 'Daniel Cooper', 1, '618.311.9052x657', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jasonsmith@example.com', 'I*6apHe@HN#&', 'Melvin Jimenez', 1, '001-797-591-5862x3840', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jonesgregg@example.org', 'E3w4_uWdA_!!', 'Desiree Jackson', 0, '+1-396-889-6291x2727', 1, '327575392_736464687761994_8673981857309914369_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('acarrillo@example.net', 'K%7JHeAYF12B', 'Brittany Hernandez', 1, '616.455.2194x63187', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('lorijones@example.org', '+&9ZgB1go8Au', 'Regina Mckee', 1, '(455)434-6175x7993', 1, '327575392_736464687761994_8673981857309914369_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('tiffanyhall@example.org', 'b4oA*nNC^nF7', 'William Charles', 1, '001-887-430-7283x489', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('brandy94@example.net', '3E5raUPm^3HM', 'Zoe Price', 0, '371-381-3755x8564', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('adamthomas@example.org', 'L(2PIhJ0MG!5', 'Jessica Richards', 1, '001-608-433-0901x67279', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('hlee@example.com', 'xY8IvxTe*9E2', 'Kristina Phillips', 1, '(289)399-1360', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('robertschmitt@example.net', '&jC6ym7b)8jj', 'Lori Jimenez', 0, '001-957-494-7179x449', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('baileykelli@example.net', 'WvHZtlDc!D15', 'Michael David', 0, '285-610-5143', 1, '327575392_736464687761994_8673981857309914369_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('blane@example.net', '!4@cjpc^)D2O', 'Melissa Eaton', 1, '001-305-561-1309x181', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('justin23@example.net', '*Ffwnumr8w0J', 'Shawn Roberson', 0, '+1-741-600-5285x263', 1, '327575392_736464687761994_8673981857309914369_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('fbrooks@example.com', 'fO4ZHc0ra_B5', 'Jacqueline Delgado', 1, '492-648-4317', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('caseydavid@example.org', '@*a@v&Ewhl3d', 'Claudia Thompson', 0, '001-542-553-5894x603', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('donovandavid@example.net', 'Oy14gVmo_7A+', 'Daniel Adams', 0, '001-382-998-1855x795', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('susan56@example.com', 'SCN&xmNdZj6p', 'William Hoffman', 1, '+1-343-414-5751', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('qavery@example.net', 'I!X3Q1ccVxkB', 'Todd Morrow', 0, '907.450.2584', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('cameron95@example.com', 'Cad+ArTu!A43', 'Sheila Berg', 1, '(289)892-0550x91840', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('anthony91@example.org', 'h))#ET!cZ5Sd', 'Jamie Collins', 1, '001-510-436-1330x895', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('gary25@example.net', 's4J)pNuA!nZD', 'Bianca Phillips', 1, '357-988-3660x937', 1, '327575392_736464687761994_8673981857309914369_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('hunterelizabeth@example.org', 'w5w4E6uy3%7U', 'William Walker', 1, '539-421-9013x71890', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('mbaker@example.org', 'Oq#nTiKx+bl6', 'Jessica Williams', 0, '+1-662-326-1096x60251', 1, '458692365_1262522218123530_2051358285189062206_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('rachelcarey@example.net', 'n)4QbXiguTQm', 'Patricia Galloway', 1, '237-877-1470x672', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('michellealvarez@example.com', 'T#4)6Ljx*saQ', 'Cristian Hernandez', 1, '762.210.0908x2980', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('keithmoses@example.com', 'mAK@2IxjrS_e', 'James Levy', 1, '001-721-770-7852x337', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('lwheeler@example.org', 'fSlhKLLM!3rq', 'Michael Kelley', 1, '(775)514-5736x4062', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('kevin04@example.org', 'f$1UhyQxb&(6', 'Devin Hendricks', 0, '652-812-0011', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('marissapearson@example.net', 'b83KuqC$*d4U', 'Joseph Green', 1, '001-248-881-5202x598', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('benjaminward@example.org', '2Rf$+aNa@kd&', 'Joel Douglas', 0, '+1-849-620-5305x6269', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('cevans@example.org', '%O57wbpwN7+R', 'Thomas Mckay', 0, '879-829-5959', 1, '458692365_1262522218123530_2051358285189062206_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jjohnson@example.org', '0R9qirTo%rTe', 'Dawn Wheeler', 1, '357.333.8498', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('dean68@example.com', '4AR+u8w@Dp6M', 'Lucas Hood', 0, '+1-252-966-7823x7453', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('barbara70@example.org', 'f04ejpcym!U#', 'Jason Rodriguez', 0, '001-741-238-8530', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('zdonovan@example.org', 'l#2l#0$nRmNb', 'Felicia Sullivan', 1, '201.398.0357', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('kelly26@example.com', ')w1VUgn@i_0G', 'Bryan Brewer', 0, '3102031197', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('seangarza@example.net', '%zx3%ha(0V2N', 'Tonya Melton', 0, '545.631.5272', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('kaitlynmoon@example.com', '*D0Y!uLnrF)G', 'James Campbell', 0, '2307959090', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('esparzacraig@example.net', 'NW@Z+yUx$7q7', 'Jeremy Floyd', 0, '956-841-5134', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('petermiller@example.org', '%tuID3jQ^5D4', 'Tiffany Shelton', 1, '250.796.6680x30238', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('hdixon@example.net', '^4TEKMzt*z9d', 'Christopher King', 1, '836.354.1666', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('kelleyveronica@example.net', 'J3u3poN4%!zI', 'Brianna Simmons', 1, '299-928-8018x073', 1, '327575392_736464687761994_8673981857309914369_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('leslieedwards@example.org', 'SC5)BdJH_aAW', 'Casey Key', 1, '228-644-0518x3259', 1, '458692365_1262522218123530_2051358285189062206_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('earl81@example.org', '!@M52EYwXvaf', 'Sheena Jackson', 1, '612.627.3350x450', 1, '452613735_1036702941161043_2918307811633307299_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('lfisher@example.com', '4u^6UkAc@w3G', 'Holly White', 0, '(742)445-7455x185', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('david02@example.net', '*V@+p5CxvZ*&', 'Mathew Taylor DDS', 0, '001-227-528-2760x21722', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jason14@example.org', '217Hc+2W&_wv', 'Devin Rogers', 1, '001-887-481-3289x202', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('paul75@example.org', '0U08Teng@RJO', 'David Jones', 1, '465-299-1937x95694', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('ibrown@example.net', '#7BQ@s2*+EcA', 'Robert Williams', 0, '2177544508', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('grantdave@example.net', 'QRuX$8ZkW5^1', 'Lindsay Wong', 0, '(358)632-3998', 1, '458692365_1262522218123530_2051358285189062206_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('marquezrachel@example.net', '!_0JriywNnO1', 'Brittany Moore', 0, '+1-482-711-4497x892', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('moorevictoria@example.net', 'B76T#yRq)^IC', 'Brandon Robertson', 0, '551-890-4621x005', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('rhodespamela@example.com', 'CnRP4bbu+00B', 'Tammy Brown', 1, '4759039417', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('kim79@example.org', '09E*@N488&*w', 'Richard Jensen', 0, '(380)453-8043', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('ncaldwell@example.org', 'o)FbZTkyXs7P', 'Alexis Jordan', 0, '290-275-4286x485', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('nicholaslee@example.org', 'q)VX4GKwXyv5', 'Joann Mills', 1, '(339)517-5111x363', 1, '327575392_736464687761994_8673981857309914369_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('dawnwade@example.org', '@9CI9yyj4vV)', 'Jenny Robinson', 0, '433-686-0582', 1, '327575392_736464687761994_8673981857309914369_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('thomasmack@example.com', '#7EyPMlotGDw', 'Carrie Cameron', 0, '914-237-1106x789', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('zwright@example.net', 'J6dUQKw!&LCD', 'Raymond Hamilton', 1, '462-494-3696x32088', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('iking@example.com', '1Y9KLmKcC9+X', 'Hunter Jones MD', 0, '451-265-6225x558', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('mathewsshelly@example.com', 'm9)^8nOvWREM', 'Christopher White', 0, '214.996.8972x9484', 1, '458692365_1262522218123530_2051358285189062206_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('wesleytyler@example.com', 't&tU7_cGR!8D', 'Kellie Mann', 1, '882.881.7890x46345', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('wrightmichelle@example.net', '*3Oc%M(25go9', 'Vincent Hodges', 0, '520-995-3531x86366', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('buckkelly@example.org', '2m4m$v3J_TvM', 'Paul Pugh', 0, '+1-243-346-3915', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('stephaniewarner@example.org', 'ai_E%7Ou^pk0', 'Erin Morales', 1, '(589)262-7480x480', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('paul60@example.net', 'OPTS7UGtq$R1', 'Lisa Peterson', 0, '409-739-3016x05700', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('ashley51@example.net', 'OUu8+Td2B#2x', 'Christine Wilson', 1, '(353)991-5627', 1, '327575392_736464687761994_8673981857309914369_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('georgerubio@example.org', '!7pnf+jKWBaZ', 'Eric Huffman', 0, '001-524-632-2024x4634', 1, '458692365_1262522218123530_2051358285189062206_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('hansentheresa@example.net', 'N*k6poTP%fEk', 'Dr. Ryan Sloan MD', 1, '753-754-2554', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('paulbrewer@example.com', '#k0orIgrc(W&', 'Jeremy Robles', 1, '+1-664-595-4886', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('hilljennifer@example.com', '!^TSbCXxc3^e', 'Garrett Graham', 0, '289-770-0882x89935', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('vcasey@example.net', '0#Q5nBimBF8R', 'Jason Cameron', 1, '404-589-7655x142', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('lorikim@example.org', '*5LcayBdD_4*', 'Tina Morales', 0, '001-562-774-4846x6555', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('perezchristopher@example.net', '*X^wP(k2M9BG', 'Emily Moore', 1, '+1-208-231-7983', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('grossjacob@example.org', 'sLXaLglig(0U', 'Sara Briggs', 0, '794.892.4886', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('waltersapril@example.com', 'h2O4ilOg&QpG', 'Michelle Taylor', 0, '503-606-6413x465', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('deborahkim@example.net', '@yW6cX!cpB7Y', 'Richard Moore', 1, '972-925-1727x9467', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('mgray@example.net', 'gP^b&d7hy%2M', 'Ann Johnson', 1, '251-653-6807', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('mary11@example.org', 'nM50BFh2!XSM', 'Brandon Melendez', 1, '(518)436-1001x21269', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('natalie54@example.net', 'O!6SM1luBp2w', 'Cole Bradley', 1, '+1-555-966-6101x925', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('lopezricky@example.com', 'tYE6nVv+@5WM', 'Gerald Hutchinson', 0, '+1-414-840-3259', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('terrance79@example.net', '4jskJoMg)FLp', 'Chad Young', 0, '+1-516-815-4890x6689', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('sandersscott@example.org', '62K#(5Pm)TmD', 'Natalie Scott', 0, '(725)306-9619', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('erica10@example.net', '$GqHsM#J+g1!', 'Benjamin Bolton', 0, '001-600-405-0745x5884', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('rwilliams@example.org', '(AAJQvon5y(&', 'Dylan Taylor', 0, '+1-681-667-8800x323', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('carlsonluis@example.org', '#8*9zOsVn3@K', 'Jeremy Velasquez', 1, '760-846-0805x099', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('yjohnson@example.net', '@Q27qe7$U)P)', 'Lisa Fields', 1, '4014314165', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('brianjones@example.org', '*dm6yALzKZ!o', 'Lauren Love', 0, '809-942-6276x6318', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('elizabethbauer@example.net', 'e$Uv1RmdIobQ', 'Robert Barnes', 0, '9126102480', 1, '458692365_1262522218123530_2051358285189062206_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('danielcarter@example.net', '&Fs29HnvI_rS', 'Michael Evans', 1, '001-809-781-6887', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('bstevens@example.com', '(VDVjPmjc81L', 'Miss Tami Murphy MD', 0, '518-887-4994x80153', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('fbarton@example.org', '2!jvtMqGlt!8', 'Angel Hoffman', 0, '518-374-2867x339', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('hayleyjohnson@example.net', '+UD8PRCu1#!Y', 'Johnny Bass', 0, '(837)850-4289x2386', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('james57@example.org', 'NFZ8sp+*)e4l', 'Joshua Taylor', 0, '2923070987', 1, '327575392_736464687761994_8673981857309914369_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('stephanie94@example.com', 'K8wFHD1h(do!', 'Gregory Woodward', 1, '825.969.3759', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('ujimenez@example.net', '$*z6TmzsoP#9', 'Omar Flores', 0, '+1-556-897-9146x516', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('xmunoz@example.net', 'TJ)0l6BuI@ZV', 'Andrew Barron', 0, '250.401.3322', 1, '327575392_736464687761994_8673981857309914369_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('hendersonkenneth@example.net', '(70A2!Iu&hF+', 'Erica Porter', 1, '+1-378-890-7801x8513', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('michaelarnold@example.com', 'Lr6HmEJg^+1V', 'David Henson', 0, '7105322362', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('justin59@example.com', 'fcU9g(Xn&2rp', 'Travis Hamilton', 0, '238-355-2286x6868', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('qwilliams@example.com', '@U_f^gDQ8zUg', 'Joanna Graham', 0, '867.780.2706x101', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('blopez@example.net', '$QoEFyExrr+9', 'Julie Li', 1, '3829808277', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('ijohnson@example.net', '9R@+nUwsdU3Y', 'Shane Prince', 1, '738-274-3983', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('theresacurtis@example.net', 'J)qf9Pzi+Hgk', 'Andrew Nicholson', 1, '+1-246-630-1318', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('erikthomas@example.net', 'v)v8J6FiLe4i', 'Wendy Ramirez', 1, '946-389-5407x028', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-03');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('watersashley@example.org', '1w0%6yk_HNEX', 'Derrick Douglas', 1, '+1-505-954-0639x00746', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-05');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('sylvia91@example.org', '_YL&!WVkP5%O', 'Teresa Arroyo', 0, '+1-698-469-8378', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('tanya98@example.net', 'M8#mEK0y^zi2', 'John Bishop', 1, '001-477-213-1423x486', 1, '319629052_636948301448637_6411378465253373240_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('davisalex@example.com', '4o%r8V!zad&O', 'Dr. Jonathan Rios DDS', 0, '851.322.8190x19304', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('hmontgomery@example.net', '_(7%0_kZ42Ap', 'Steve Taylor', 1, '271.825.4895x715', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('adyer@example.net', '@r4%TL(jT33M', 'Michelle Salas DVM', 0, '293.518.0605', 1, '452613735_1036702941161043_2918307811633307299_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('rodriguezsherry@example.org', '$9A1bgx6_bNh', 'Caroline Mckenzie', 0, '395-674-7942x2394', 1, '438305137_417469171219039_6639768305271669477_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('charper@example.net', '2Yj4CpI(!#ae', 'Danielle Howard', 0, '+1-253-312-7021x87832', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('phillip25@example.org', 'E(*iDJeS@o3@', 'Megan Barrett', 1, '(356)224-4421x6797', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jcalhoun@example.org', '+z7Exqw0@SxQ', 'Seth Nelson', 1, '367.429.4154x38599', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-01');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('jeremybrown@example.org', '7iONPe81N!J6', 'Kelly Fritz', 0, '511-703-5868x91431', 1, '466848405_1082416906954945_5677972795287742480_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('christopher72@example.com', 'h744P@zuim*X', 'Tammy Hill', 1, '4594906262', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-10');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('janet61@example.org', '2)RAlu8Q(h$T', 'Dennis Ward', 0, '+1-262-372-8654x016', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('richardsonveronica@example.net', '#q$l5NrmghID', 'Dr. Krystal Marks', 1, '(206)409-5704x442', 1, '452613735_1036702941161043_2918307811633307299_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('rmoss@example.net', 'rDHF&omCd!3k', 'Christian Edwards', 1, '716.593.1565', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('taylorryan@example.org', '0xu5nPoZ#8TZ', 'Megan Lee', 1, '001-961-768-0314x408', 1, '471169424_1319175582833154_3011200294351527626_n.jpg', '2025-01-13');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('gloriazimmerman@example.net', '$UI5Mi!OF$yU', 'John Rowland', 1, '(619)943-7353x7110', 1, '372760190_1121456885908149_7399620038577033094_n.jpg', '2025-01-09');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('kgibbs@example.org', '#3D@MPBkdO$w', 'Mrs. Marisa Mendez', 1, '001-254-244-8084', 1, '472941986_1155418476238062_1955380485918361774_n.jpg', '2025-01-12');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('richard13@example.com', ')qZaI*wo7UIw', 'Kristen Stephens', 1, '001-335-853-9628x919', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('obrienmichael@example.com', '%CDLU4Ab(H3^', 'Paul Scott', 1, '+1-829-526-8029', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('kathrynbrown@example.com', '!n8RHxbFDa83', 'David Luna', 1, '620-440-8748x946', 1, '471284763_1274784223644303_8598282488349733484_n.jpg', '2025-01-02');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('sarah46@example.com', '&_e+$F&uo7Tu', 'Charles Chavez', 1, '(428)478-1816x86566', 1, '436221157_2253022345049758_3574524445592276292_n.jpg', '2025-01-06');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('williamroberts@example.com', 'B+4CgqkqKNTF', 'Natalie Graham', 0, '001-358-813-2860x57131', 1, '338975156_3502226330021730_1437390959646321743_n.jpg', '2025-01-11');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('chelseyreese@example.org', '@pg9pQpz*BRF', 'Ashley Smith', 0, '+1-215-741-5613x352', 1, '471972800_1103644464585549_6787611843147974288_n.jpg', '2025-01-04');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('autumnparker@example.com', 'tD4RbD7s%5o)', 'Beth Young', 0, '523-334-2390', 1, '463091504_1624168248183768_390425415308033944_n.jpg', '2025-01-08');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('maxwellcaitlin@example.net', '&5Hmgg6H)r6U', 'Jeffrey Middleton', 1, '949-781-0259', 1, '327575392_736464687761994_8673981857309914369_n.jpg', '2025-01-07');
INSERT INTO users (email, password, fullname, role, phone, status, avatar, createdAt) VALUES ('nathanmarquez@example.net', 'Po3H9fAym(G5', 'Mark Dixon', 0, '441-202-6517x555', 1, '458692365_1262522218123530_2051358285189062206_n.jpg', '2025-01-06');