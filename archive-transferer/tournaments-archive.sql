-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 29, 2013 at 05:54 PM
-- Server version: 5.1.44
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cwt_archive`
--

-- --------------------------------------------------------

--
-- Table structure for table `tournaments`
--

CREATE TABLE IF NOT EXISTS `tournaments` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `year` smallint(4) NOT NULL,
  `status` enum('pending','group','playoff','finished','archived') COLLATE utf8_bin NOT NULL DEFAULT 'pending',
  `gold_id` int(11) NOT NULL,
  `silver_id` int(11) NOT NULL,
  `bronze_id` int(11) NOT NULL,
  `review` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=12 ;

--
-- Dumping data for table `tournaments`
--

INSERT INTO `tournaments` (`id`, `year`, `status`, `gold_id`, `silver_id`, `bronze_id`, `review`) VALUES
(1, 2002, 'archived', 154, 25, 143, ''),
(2, 2003, 'archived', 40, 154, 137, ''),
(3, 2004, 'archived', 40, 89, 52, ''),
(4, 2005, 'archived', 47, 93, 0, 0x435754203230303520776173206d6f73746c7920646f6d696e6174656420627920776172207665746572616e732e20416c74686f75676820746865206669727374203220706c61636573206f662074686520746f75726e616d656e74207765726520776f6e206279206e6577636f6d6572732074686579207765726520746865206f6e6c79206f6e6573206265696e6720696e2074686520717561727465722d66696e616c732e2054686572652077657265206d616e792064656c61797320746f2074686520746f75726e616d656e7420616e6420697420776173206d61726b6564206279206c6f6e67206c616767732066726f6d206365727461696e20706c61796572732e20416c736f2c20746865726520776173207468652063617365206f662074686520226769726c222c206120636861726163746572206b6e6f776e20617320576f726d696e674769726c2c206120737570706f736564206769726c2066726f6d20557a62656b697374616e2c2077686963682077617320746865206372656174696f6e206f662061207275737369616e20776f726d65722077686f7365206e69636b204920686f6e6573746c7920646f6e277420726563616c6c2c20616e642077686f2068616e646564206f76657220746865206c696520616674657220746865207175616c69666965727320746f206f6e6520776f726d65722077686f206861646e2774206861642061206368616e636520746f20626520696e2064756520746f20746865206c61636b206f662073706f747320617661696c61626c652c204a6f686e6d69722e2048652070726f63656564656420696e2068697320646973677569736520746f207468652073656d692d66696e616c73206275742068652072657665616c6564206166746572207265616c697a696e6720776861742068652077617320646f696e672e205468652070656e616c747920776173206e6f7420746f2062652061626c6520746f20636f6e74696e756520696e206869732070726f67726573732e205468652064757463686d616e20484843206d616465206120636f6d656261636b206166746572206f6e652079656172206f6620616273656e636520616e64206974207761732054656c65747562626965732773206c617374204357542e),
(5, 2006, 'archived', 27, 17, 40, 0x496e20746869732065646974696f6e206f662043575420746865206e756d626572206f6620776f726d6572732077617320696e6372656173656420746f2034302073696e63652061207175616c69666965727320636f6d7065746974696f6e20776173206f7574206f66207175657374696f6e2064756520746f2074686520616d6f756e74206f662074696d65206e656564656420746f206861766520697420676f696e672c20706c7573207468652064656372656173696e67206e756d62657273206f66206e6f726d616c20776f726d65727320696e207468652057575020636f6d756e6974792c20776869636820616c736f206e6172726f7765642074686520636f6d7065746974696f6e20706f73736962696c6974657320746f207468697320657874656e742e2054696d656b656570696e672077617320656e666f72636564206279204d725450656e6775696e2077686f20646973747269627574656420736f6d65206f6620686973206472656164656420706f696e742070656e616c7469657320616e642063757420736f6d6520776f726d657273206f66662066726f6d2074686520746f75726e616d656e742c20627574206e6f742074686174206d616e792e20546865206d6f73742074696d65732074686520746f75726e616d656e7420736c6f77656420646f776e207761732064756520746f20706572736f6e616c2068616e646963617073206f66206365727461696e20776f726d6572732e20536f6d652070726f626c656d732072656c6174696e6720646973636f6e6e656374696f6e732077657265207265706f7274656420627574207468657265207761736e2774206d756368206f662061206361736520676f696e672066726f6d207468657365206973737565732e20536f6d652076616c7561626c65206e6577636f6d65727320616464656420677265617420666c61766f7220746f2074686520746f75726e616d656e7420616e642069662077652074616b652061207065656b20617420746865206b6e6f636b6f7574207374616e64696e6773207765276c6c2073656520612037352520726174696f206f66206e6577636f6d657273206f6e2074686520717561727465722d66696e616c732c20616c74686f756768207468652032207665746572616e73206f662043575420696e20746861742032352520726174696f206f66206e6f6e2d6e6577636f6d6572732061637475616c6c79206d61646520697420746f2074686520706f6469756d212054686520746f70206e6577636f6d657273206f66204357542032303036207765726520536972476f726173682c20526166616c75732c20634f4f4c2c204672616e70657461732c2058576f726d2c2044766f726b696e20616e64204a6f686e6d69722e20416c736f2072656c6174696e6720706c61796572732c207468652070726573656e6365206f66207468652062692d6368616d70696f6e204a69677361772073686f756c64206265206e6f7465642073696e636520697420776173206120636f6d656261636b2066726f6d207468652067726176652062792074686520706f6c69736820746974616e2e20416e64206c61737420627574206e6f74206c656173742c207468652077696e6e65722077617320446172696f2c2077686f2062656174656420746865207275737369616e206e6577636f6d6572204a6f686e6d697220696e207468652066696e616c2c20616e642077686f20776173207468657265666f72652063726f776e6564206368616d70696f6e206f66204357542c206a757374696679696e67206869732065766f6c7574696f6e20617420746865206e6f726d616c207374796c6520696e20746865206c6173742079656172732c207768696368206c65642068696d20746f206120686967686c7920636f6e73697374656e74206c6576656c206f6620706c61792e20546869732077617320746865206c6173742065646974696f6e206f662043575420696e207468652057575020666f726d61742e),
(6, 2007, 'archived', 27, 40, 0, ''),
(7, 2008, 'archived', 30, 37, 38, ''),
(8, 2009, 'archived', 17, 38, 13, ''),
(9, 2010, 'archived', 11, 10, 27, 0x323031302077617320696e20657665727920617370656374206120627265616b7468726f75672e205468616e6b7320746f205a656d6b652c2043575420706c61796572732068616420666f722074686520766572792066697273742074696d6520696e20382d7965617273204357542c2074686520706f73736962696c69747920746f2075706c6f61642c20636f6d6d656e7420616e6420726174652074686569722067616d65732e20546865206e6577207369746520687474703a2f2f7777772e6377736974652e636f6d20616c6c6f776564207573206d6f64657261746f727320746f20737472656e677468656e20706c61796572732061637469766974793a203325206f6620766f696465642067726f75702073746167652067616d65732028323030393a203238252920776974682073696d756c74616e656f757320636f6e73696465726174696f6e2074686174207468652077686f6c6520746f75726e616d656e74206f6e6c7920656e64757265642032206d6f6e7468732c2061726520676f6f64206578656d706c657320666f7220612072616973696e672070726f66657373696f6e616c69736d2e204120676f6f64206d6978206f66207665746572616e732028536972476f726173682c204279746f722c204e6f726d616c50726f292c20726f6f6b696573202849766f2c20636875766173682c20466f6e736563612920616e6420416c6c2d53746172732028446172696f2c204d61626c616b2920666f726d656420616e20756e707265646563656e74207175616c6974617469766520686967682d636c6173732073746172746572206669656c642e0d0a0d0a456c6576656e20646f6e6f7273206d61646520697420706f737369626c652c2074686174204b61797a20616e6420446172696f20617320326e6420616e642033726420706c61636564206775797320676f742074726f70686965732e2054686520756e62656174656e206368616d70696f6e204d61626c616b20676f7420626573696465732068697320676f6c64656e2063757020612063617368207072697a65206f662061626f757420313130202420285553292e0d0a0d0a537461746973746963733a20687474703a2f2f7777772e6377742e626f617264732e6e65742f696e6465782e6367693f616374696f6e3d646973706c617926626f6172643d74616c6b68657265267468726561643d35303026706167653d310d0a5468616e6b7320616e64204772656574696e67733a20687474703a2f2f7777772e6377742e626f617264732e6e65742f696e6465782e6367693f616374696f6e3d646973706c617926626f6172643d74616c6b68657265267468726561643d35303226706167653d31),
(10, 2011, 'archived', 27, 13, 11, 0x576974682074686520657870657269656e636573207765206d61646520696e20323031302c20696e2077686963682074686520686f6d6520616e64206177617920726573756c747320647572696e672067726f757020737461676520706572696f642068617665207665727920726172656c79206469666665726564202c205a656d6b6520616e64206d65206465636964656420746f206163636f6d6d6f64617465207468652073797374656d20746f20746865207265616c69746965732e2046726f6d2032303131206f6e2c2074686520706c61796572732068616420746f20706c6179206f6e6c79206f6e652062657374206f6620666976652067616d6520616761696e73742074686569722067726f7570206f70706f6e656e74732e205468616e6b7320746f2074686973206d6f64696669636174696f6e20616e64207468652067656e65726f73697479206f6620313820646f6e6f72732c2077686f207374696d756c617465642074686520706c6179657273207769746820612063617368207072697a65206f662033303020242855532920616e6420332074726f70686965732c2077652063656c6562726174656420666f72207468652066697273742074696d6520696e2043575420686973746f7279206120746f75726e616d656e742077697468203130302520636f6d706c657465642067616d65732e0d0a0d0a416c74686f756768207468652073746172746572206669656c642077617320706f70756c61746564207769746820706c656e7479206e6f7461626c6520706c61796572732c20692e65782e20666f757220666f726d657220435754206368616d70696f6e73202846616e746f6d61732c2052616e646f6d30302c204a6f686e6d69722c204d61626c616b2920616e6420746865206265737420706c6179657273206f66204f70656e204e6f726d616c204c65616775652028636875766173682c204b61797a2c204b6f726173292c20446172696f7320746869726420435754206368616d70696f6e73686970207761736e277420617420616e792074696d6520656e64616e67657265642e204166746572206869732077696e20696e203230303620616e64203230303720446172696f2063656c6562726174656420696e203230313120686973206861742d747269636b20616e642063726f776e656420686973207369787468204357542070617274696369706174696f6e20776974682068697320347468206d6564616c2028337820676f6c642c2031782062726f6e7a65292e0d0a0d0a496e206f7264657220746f206d616b652043575420616e64207468657265627920496e7465726d656469617465206d6f726520706f70756c61722c207765207374617274656420746f2073747265616d206f757220746f75726e616d656e742067616d65732e20546875732c206f7468657220706c61796572732c2077686f206f726967696e616c6c7920776f756c646e27742070617274616b6520696e20616e7920496e7465726d65646961746520746f75726e616d656e742c20696d6d6564696174656c792077657265206f6e20626f61726420616e64206d6164652043575420696e206869732074656e7468206a7562696c6565206576656e206d6f726520706f70756c61722e205768656e2065766572797468696e6720776173206e65772c20696e20746865207374617274696e672074696d65206f662073747265616d732c206974207765726520706c6179657273206c696b65206b616c616261626120616e64206b68616d736b692077686f20707573686564207468652077686f6c6520646576656c6f70706d656e742e204c696b6520746869732c20746865206d6f737420696e746572657374696e67204357542067616d65732c2073656d692d66696e616c7320616e642066696e616c2067616d6573207765726520666f6c6c6f77656420627920616e20756e707265646563656e742062696720636f6d6d756e6974792e0d0a0d0a537461746973746963733a20687474703a2f2f7777772e6377742e626f617264732e6e65742f696e6465782e6367693f616374696f6e3d646973706c617926626f6172643d746f75726e616d656e74267468726561643d35323426706167653d31),
(11, 2012, 'playoff', 46, 55, 10, 0x496e2032303132207765206861642061206e69636520626174746c65206f662063757272656e742070726f732077686f20676176652065766572797468696e6720696e2074686520706c61796f66667320616e642067726f757020737461676520746f2072656163682074686520676f616c206f662077696e6e696e672c20686176696e67206d616e7920636c6f736520332d3220766963746f726965732e205665727920696e746572657374696e6720616e6420636c6f73652067616d65732068617070656e65642c20736f6d6574696d657320616c736f20616761696e7374207468652070726564696374696f6e206f662074686520766f7465732c206c696b6520546f6d656b2077696e6e696e67204d61626c616b20616e64206c61636f7374652077696e6e696e67204b6f726173203a292e206368757661736820776f6e207468652063757020616e6420746865207072697a65206d6f6e6579206f662031373020646f6c6c617220616674657220686176696e6720746f2066696768742076732e20616c6d6f737420616c6c206f6620506f7420413a204661442c204b61797a2c206e6170707920616e64204b6f7261732e20486520696d70726f76656420647572696e6720746865206c61737420736561736f6e732061206c6f7420616e642070726f7665642068696d73656c66206120776f7274687920766963746f722077697468206869676820636f6e63656e74726174656420616e64206465657020737472617465677920706c6179696e67207374796c652e2054686f75676820576f726d7320696e2067656e6572616c2077656e7420612062697420696e6163746976652c207374696c6c20616c6c2067616d6573207765726520706c617965642e205468616e6b7320666f72207468697320746f75726e65792c2069742077617320612067726561742066756e2e);

-- --------------------------------------------------------

--
-- Table structure for table `tournaments_moderators`
--

CREATE TABLE IF NOT EXISTS `tournaments_moderators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tournament_id` int(11) NOT NULL,
  `moderator_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `tournaments_moderators`
--

INSERT INTO `tournaments_moderators` (`id`, `tournament_id`, `moderator_id`) VALUES
(1, 1, 25),
(2, 1, 145),
(3, 2, 25),
(4, 2, 52),
(5, 3, 25),
(6, 3, 52),
(7, 4, 25),
(8, 4, 52),
(9, 5, 25),
(10, 5, 52),
(11, 6, 25),
(12, 6, 52),
(13, 7, 40),
(14, 8, 5),
(15, 8, 43),
(16, 9, 2),
(17, 9, 30),
(18, 9, 1),
(19, 10, 2),
(20, 10, 1),
(21, 11, 10),
(22, 11, 2),
(23, 11, 1);