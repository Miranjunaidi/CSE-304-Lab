CREATE TABLE `laptop` (
  `model` varchar(7) DEFAULT NULL,
  `speed` int(2) DEFAULT NULL,
  `ram` int(2) DEFAULT NULL,
  `hd` int(2) DEFAULT NULL,
  `screen` int(2) DEFAULT NULL,
  `price` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO `laptop` (`model`, `speed`, `ram`, `hd`, `screen`, `price`) VALUES
('dell', 12, 34, 12, 16, 100),
('windows', 34, 39, 14, 18, 100);


CREATE TABLE `pc` (
  `model` varchar(7) DEFAULT NULL,
  `speed` int(2) DEFAULT NULL,
  `ram` int(2) DEFAULT NULL,
  `hd` int(2) DEFAULT NULL,
  `price` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO `pc` (`model`, `speed`, `ram`, `hd`, `price`) VALUES
('windows', 12, 13, 99, 1001),
('hp', 13, 98, 77, 3000);

CREATE TABLE `printer` (
  `model` varchar(7) DEFAULT NULL,
  `color` varchar(4) DEFAULT NULL,
  `type` int(2) DEFAULT NULL,
  `price` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `printer` (`model`, `color`, `type`, `price`) VALUES
('windows', 'red', 14, 10000),
('apple', 'blue', 17, 30000),
('windows', 'red', 123, 899),
('apple', 'red', 89, 899),
('os', 'red', 98, 899),
('delll', 'red', 12, 899),
('delll', 'red', 34, 899),
('001', 'red', 12, 899);

# a
DELIMITER $$
CREATE TRIGGER `trig1` BEFORE UPDATE ON `pc` FOR EACH ROW begin
if (new.price>old.price) then
if (old.speed=new.speed) then
signal sqlstate '45000' set message_text='lowest price exist available for same speed';
end if;
end if;
end
$$
DELIMITER ;

#b

DELIMITER $$
CREATE TRIGGER `trig2` BEFORE INSERT ON `printer` FOR EACH ROW begin
IF (SELECT model FROM printer WHERE model = NEW.model) THEN
signal sqlstate '45000' set message_text='model already exists';
end if;
end
$$
DELIMITER ;

#c

DELIMITER $$
CREATE TRIGGER `trig3` BEFORE UPDATE ON `laptop` FOR EACH ROW begin
set @avg = (select avg(price) from laptop);
if @avg<1500 then
signal sqlstate '45000' set message_text='Sorry not possible since avg is lessthan 1500';
end if;
end
$$
DELIMITER ;