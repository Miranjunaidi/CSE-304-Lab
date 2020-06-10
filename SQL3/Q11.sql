CREATE TABLE `instructor` (
  `id` int(5) DEFAULT NULL,
  `name` varchar(7) DEFAULT NULL,
  `dep_name` varchar(3) DEFAULT NULL,
  `salary` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `instructor` (`id`, `name`, `dep_name`, `salary`) VALUES
(10022, 'sharath', 'cse', 1000000),
(10097, 'akhil', 'cse', 10000000),
(10024, 'rohith', 'cse', 100000000);

CREATE TABLE `section` (
  `course_id` int(1) DEFAULT NULL,
  `sec_id` int(1) DEFAULT NULL,
  `semester` int(3) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `building` int(2) DEFAULT NULL,
  `room_number` int(2) DEFAULT NULL,
  `time_slot_id` int(3) DEFAULT NULL
);


INSERT INTO `section` (`course_id`, `sec_id`, `semester`, `year`, `building`, `room_number`, `time_slot_id`) VALUES
(1, 2, 123, 1234, 32, 23, 134),
(2, 3, 134, 1998, 41, 23, 135),
(3, 4, 134, 1236, 41, 24, 136);



CREATE TABLE `teaches` (
  `id` int(5) DEFAULT NULL,
  `course_id` int(1) DEFAULT NULL,
  `sec_id` int(1) DEFAULT NULL,
  `semster` int(3) DEFAULT NULL,
  `year` int(4) DEFAULT NULL
);

INSERT INTO `teaches` (`id`, `course_id`, `sec_id`, `semster`, `year`) VALUES
(10022, 1, 2, 123, 1998),
(10097, 2, 3, 567, 2345),
(10024, 3, 4, 134, 2000);



#Asswerion 1

create assertion check not exists
 ( select ID, name, section id, semester, year, time slot id, 
count(distinct building, room number) 
from instructor natural join teaches natural join section 
group by (ID, name, section id, semester, year, time slot id) 
having count(building, room number) > 1)




# Asswertion 2

create assertion check not exists
 ( select ID, name, section id, semester, year) 
from instructor natural join teaches 
group by (ID, name, section id, semester, year) 
having count(course_id) > 1)
