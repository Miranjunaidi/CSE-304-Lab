CREATE TABLE `dep` (
  `depno` int(2) DEFAULT NULL,
  `depname` varchar(3) DEFAULT NULL,
  `depage` int(2) DEFAULT NULL,
  `eno` int(1) DEFAULT NULL



  CREATE TABLE `depart` (
  `departno` int(2) DEFAULT NULL,
  `departname` varchar(5) DEFAULT NULL,
  `location` varchar(9) DEFAULT NULL

CREATE TABLE `emp` (
  `eno` int(1) DEFAULT NULL,
  `ename` varchar(5) DEFAULT NULL,
  `eage` int(2) DEFAULT NULL,
  `salary` int(5) DEFAULT NULL,
  `departno` int(3) DEFAULT NULL,
  `supereno` int(2) DEFAULT NULL


  INSERT INTO `depart` (`departno`, `departname`, `location`) VALUES
(12, 'cse', 'hyderabad'),
(15, 'civil', 'chennai');

INSERT INTO `emp` (`eno`, `ename`, `eage`, `salary`, `departno`, `supereno`) VALUES
(1, 'akhil', 19, 10000, 123, 2),
(2, 'arjun', 20, 20000, 145, 13),
(3, 'shara', 12, 1200, 123, 1),
(4, 'rohit', 12, 1200, 123, 1),
(1, 'sas', 12, 12344, 123, 2),
(1, 'sas', 12, 123434, 123, 2),
(1, 'sas', 12, 1234456, 123, 2),
(1, 'jack', 33, 700000, 1, 3),
(3, 'jerry', 53, 1000000, 1, 4),
(4, 'rai', 70, 7000, 1, 3);
COMMIT;


INSERT INTO `dep` (`depno`, `depname`, `depage`, `eno`) VALUES
(12, 'cse', 12, 1),
(14, 'ece', 45, 3),
(1, 'cse', 12, 1),
(1, 'cse', 12, 1),
(1, 'cse', 12, 1),
(1, 'cse', 12, 1),
(1, 'cag', 5, 3),
(2, 'cag', 5, 3),
(3, 'cae', 2, 3),
(4, 'cbe', 70, 1),
(5, 'gbe', 33, 1),
(6, 'gbe', 70, 1),
(7, 'agb', 70, 4);

# Exompyee salary

select avg(emp.salary) as avg
from (select eno, count(depno) as countofdep from dep group by eno) as n, emp
where n.eno = emp.eno and n.countofdep > 2;
end$$


select e.eno, e.ename from emp as e where e.eno>1;
end$$
