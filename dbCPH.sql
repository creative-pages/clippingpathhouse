-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 27, 2021 at 01:06 AM
-- Server version: 5.7.35
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbCPH`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_account_info`
--

CREATE TABLE `tbl_account_info` (
  `id` int(11) NOT NULL,
  `fld_acc_name` varchar(300) NOT NULL,
  `fld_user_name` varchar(300) NOT NULL,
  `fld_password` varchar(300) NOT NULL,
  `fld_url` text NOT NULL,
  `fld_saved_by` varchar(50) NOT NULL,
  `fld_saved_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_additional_services`
--

CREATE TABLE `tbl_additional_services` (
  `id` int(11) NOT NULL,
  `fld_service_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_additional_services`
--

INSERT INTO `tbl_additional_services` (`id`, `fld_service_name`) VALUES
(7, 'Image Shadow Creation'),
(8, 'Web Image Optimization'),
(10, 'Colour Correction');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin_user`
--

CREATE TABLE `tbl_admin_user` (
  `id` int(11) NOT NULL,
  `fld_fullname` varchar(200) NOT NULL,
  `fld_username` varchar(50) NOT NULL,
  `fld_password` text NOT NULL,
  `fld_user_type` varchar(50) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `vcode` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_admin_user`
--

INSERT INTO `tbl_admin_user` (`id`, `fld_fullname`, `fld_username`, `fld_password`, `fld_user_type`, `mobile`, `vcode`) VALUES
(1, 'Sezan Mahmud', 's.mahmud', 'b9478274bbc7555c795dadafd2d44fc5ab731dae', 'Super Admin', '8801972489608', '5379'),
(4, 'Client Web Portal Support', 'support', 'fc1ab18ba68a7d3d8388e45de2cca61d1f60c50a', 'General', '', '0341');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_captcha`
--

CREATE TABLE `tbl_captcha` (
  `id` int(11) NOT NULL,
  `fld_ques` varchar(10) NOT NULL,
  `fld_ans` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_captcha`
--

INSERT INTO `tbl_captcha` (`id`, `fld_ques`, `fld_ans`) VALUES
(1, '6+5', '11'),
(2, '5+8', '13'),
(3, '9+1', '10'),
(4, '2+8', '10'),
(5, '5+7', '12'),
(6, '9+9', '18'),
(7, '7+7', '14'),
(8, '4+5', '9'),
(9, '1+4', '5'),
(10, '3+5', '8'),
(11, '8+8', '16');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contact`
--

CREATE TABLE `tbl_contact` (
  `id` int(11) NOT NULL,
  `fld_name` varchar(200) NOT NULL,
  `fld_email` varchar(200) NOT NULL,
  `fld_subject` varchar(200) NOT NULL,
  `fld_message` varchar(300) NOT NULL,
  `fld_datetime` datetime NOT NULL,
  `fld_read` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_contact`
--

INSERT INTO `tbl_contact` (`id`, `fld_name`, `fld_email`, `fld_subject`, `fld_message`, `fld_datetime`, `fld_read`) VALUES
(2, 'Honey Jain', 'contactvdpl@gmail.com', 'Photo Editing Services', 'Photo Editing services', '2020-05-06 13:52:46', 1),
(3, 'Maria Hoysted', 'maria@shannonbridgepottery.com', 'CANNOT UPLOAD', 'Hi,\n\nI wish to place a job but it seems that I cannot upload the pictures.\n\nCan you help me on this?\n\nMany thanks,\n\nMaria', '2020-05-27 10:50:35', 1),
(4, 'MD .IMTIAZ HASAN CHOWDHURY ', 'NIHANCHOWDURY@ GMAIL.COM', 'PHOTO EDITING', 'I WANT TO WORK IN YOUR COMPANY. TO EARN MONEY IN ONLINE.', '2020-06-15 14:59:46', 1),
(5, 'Michelle', 'michellequbrosi@gmail.com', 'Background Removal', 'Hi, I am looking to get 1000 images all removed from the background of a girl standing against a plain white background. As there is such a high volume of images I hope to get a competitive price.\nThanks', '2020-06-25 01:48:32', 1),
(6, 'Jaxsonsetton Altherrgy', 'jaxaltherrgy@getpostcaptain.com', 'Request Demo', 'More Information', '2020-07-01 05:05:43', 1),
(7, 'Lindsay', 'lindsayhaagphotography@gmail.com', 'White Background ', 'Hello!\n\nI have 3 images I need for an Amazon listing. Do you guys offer editing of the product as well as put it on a white background?', '2020-07-19 17:22:11', 1),
(8, 'Michelle', 'michellequbrosi@gmail.com', 'Clipping path', 'Hi, I have been in contact with Asif previously. We had agreed on a price but now he has not replied to my emails in 3 days. If I do not receive a response today I am going to have to go elsewhere as time is of the essence for the job. I would still like to work with you as I know your quality, howe', '2020-07-21 02:13:14', 1),
(9, 'Dominic', 'Dominic@thegivingmovement.com', '5000 Images to edit monthly', 'Hi, \n\nCan you email me to discuss some image editing that we need carried out. I can send the files this evening. \n\nBest,\n\nDominic \n', '2020-08-03 13:52:29', 1),
(10, 'Md Rakhu Mia', 'mdrakhumia8484@gmail.com ', 'application for the work ', 'v', '2020-08-25 17:56:34', 1),
(11, 'Md Rakhu ', 'mdrakhumia8484@gmail.com', 'application for the clipping path job', 'vvvvv', '2020-08-26 09:24:01', 1),
(12, 'Dan', 'dpattullo@gmail.com', 'Project Status', 'Hi.  I submitted a couple of projects for Photo Restoration.  But I have not heard anything about the progress.  Can you please update me on the status of these projects?  These are my first projects with your company, so I just wanted to make sure that they were in the queue.  Thanks!', '2020-08-29 10:43:28', 1),
(13, 'Vikas Kumar', 'vikasishu28976@gmail.com', 'Job', 'I want Job as a freelancer and i have 1 year experience of clipping path.\nand i will give you images PNG, only PATHS, and PSD formates.', '2020-09-15 20:18:27', 1),
(14, 'Sudhir sable', 'sudhirsable1976@gmail.com', 'Can I join as freelancer', '14 years experience in clipping path , done the 3 mini simple to 6 hours super complex orders is my especially.', '2020-09-17 18:34:53', 1),
(15, 'Gordon Lazzarone', 'glazzarone@yahoo.com', 'Multiple Orders by accident', 'I submitted multiples of the same order because the webpage was not responding. I only want one of the \"Toppers bowls and spices\" submission done.\nThank you,\nGordon', '2020-09-18 21:45:50', 1),
(20, 'Derek Tedrick-Peters', 'chattographer@gmail.com', 'Looking for new clipping, retouch, recolor company', 'hello, looking for a new company to work with.', '2020-10-12 15:02:40', 1),
(21, 'Lars Soerensen', 'ls@redmonkey.dk', 'Photo editing', 'Hello\n\nI am often in the situation that I need photo editing.\nIs it possible to get your help?\n\nRight now I have a few pitcures where I need a tv screen removed from the background.\nIf possible I could send you one picture to try your service out, and you can provide me with a price for all the pict', '2020-10-20 09:41:52', 1),
(22, 'olga ', 'interior@duroque.com', 'image retouch', 'need images retouch, color correction', '2020-10-26 01:39:55', 1),
(23, 'SANKET RAJESHBHAI CHHAYA', 'chhayasanket123@gmail.com', 'ghost maniqune  services ', 'ecom image editing ', '2020-11-03 15:29:09', 1),
(24, 'SANKET RAJESHBHAI CHHAYA', 'chhayasanket123@gmail.com', 'ghost maniqune  services ', 'ecom image editing ', '2020-11-03 15:29:15', 1),
(25, 'George Curuby', 'curuby@att.net', 'Photo clipping request', 'Greetings from Tokyo! I have 9 photos of roses, and I want the backgrounds eliminated so that the photo files are only roses on transparent backgrounds. The flower edges are sharply distinguished from the background. Is there a payment option other than a credit card? If this project is successful, ', '2020-11-07 04:56:22', 1),
(26, 'Samuel', 'samuel@howigotjob.com', 'Share your career story', 'Hi\n\nTrust you are doing good.\n\nI run www.howigotjob.com, a community platform providing career content to students and individuals who are in-between jobs. We share inspiring stories, resources, and mentorship.\n\nJob aspirants have many questions on \"How to be successful in the career?\" \"How to get t', '2020-11-13 11:33:29', 1),
(27, 'vicens Gimenez', 'info@vicensgimenez.com', 'Cancel order', 'Hello\nI have one order in process since yesterday (Match Colors) and I don Â´t have any answer of your company about budget or anything. It was urgent and the place expired this morning\nI want to cancel the job\nThank you', '2020-11-20 09:28:07', 1),
(29, 'itseme iriabho', 'isemeski@yahoo.com', 'Potrait/ full image', 'Retouching/ image enchancing', '2020-11-30 13:31:17', 1),
(30, 'Paul Vincent', 'Paul@paul-vincent.com', 'Cutouts for Amazon', 'Hello,\nIâ€™m in need of product photos for my Amazon page. I have about 4,000 products and three different angles for each. Thatâ€™s about 12,000 images. ', '2020-12-04 19:30:08', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_delivery_time`
--

CREATE TABLE `tbl_delivery_time` (
  `id` int(11) NOT NULL,
  `fld_delivery_time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_delivery_time`
--

INSERT INTO `tbl_delivery_time` (`id`, `fld_delivery_time`) VALUES
(7, '7 days'),
(12, '5 days'),
(13, '72 hrs'),
(14, '48 hrs'),
(15, '30 hrs '),
(16, '15 hrs - Price will be double'),
(17, '7 hrs - Price will be triple ');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_file_format`
--

CREATE TABLE `tbl_file_format` (
  `id` int(11) NOT NULL,
  `fld_format` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_file_format`
--

INSERT INTO `tbl_file_format` (`id`, `fld_format`) VALUES
(8, 'Photoshop ( *PSD )'),
(9, 'Photoshop (*EPS )'),
(10, 'JPEG ( *JPG; *JPEG; *JPE; *php )'),
(12, 'PNG'),
(14, 'Photoshop ( *TIFF; *TIF )'),
(15, 'Adobe illustrator (*.AI)'),
(16, 'illustrator ( *.EPS )'),
(17, '*php');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_free_quote`
--

CREATE TABLE `tbl_free_quote` (
  `id` int(11) NOT NULL,
  `fld_name` varchar(200) NOT NULL,
  `fld_email` varchar(200) NOT NULL,
  `fld_company` varchar(200) NOT NULL,
  `fld_website` varchar(200) NOT NULL,
  `fld_country` varchar(100) NOT NULL,
  `fld_main_service` varchar(50) NOT NULL,
  `fld_add_service` varchar(50) NOT NULL,
  `fld_format` varchar(30) NOT NULL,
  `fld_quantity` varchar(30) NOT NULL,
  `fld_source` varchar(30) NOT NULL,
  `fld_job_instruction` varchar(300) NOT NULL,
  `fld_submission_datetime` datetime NOT NULL,
  `fld_read` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_free_quote`
--

INSERT INTO `tbl_free_quote` (`id`, `fld_name`, `fld_email`, `fld_company`, `fld_website`, `fld_country`, `fld_main_service`, `fld_add_service`, `fld_format`, `fld_quantity`, `fld_source`, `fld_job_instruction`, `fld_submission_datetime`, `fld_read`) VALUES
(1, 'Melissa Oakes', 'angel-mel@hotmail.co.uk', '', '', 'United Kingdom', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php', '175', 'Google', 'Clipping path only - would be looking at a quote for 175 images of crockery. Interested to see what the trial images come out like. Thanks.', '2020-03-20 11:15:00', 1),
(2, 'Natalie Moffett', 'nmoffett@porchlightatl.com', '', '', 'United States', '67', '', 'PNG', '3', 'Recomandation', '', '2020-03-20 12:51:12', 1),
(3, 'Ian', 'talk@Ian.mb.ca', '', '', 'Canada', '67', '', 'PNG', '125', 'Recomandation', '', '2020-03-25 16:44:29', 1),
(4, 'Bonne Blanksma', 'bonne@blanksma.nl', '', '', 'Netherlands', '69', '', 'JPEG ( *JPG; *JPEG; *JPE; *php', '3', 'Recomandation', 'Please remove the background on the wall', '2020-04-06 08:27:26', 1),
(8, 'Beth Seitzberg', 'beths@dtrio.com', 'd.trio marketing group', '', 'United States', '67', '10', 'JPEG ( *JPG; *JPEG; *JPE; *php', '3000', 'Google', 'The attached are 3 samples of the kinds of images we have. Many are low quality and we need to get them clipped so they can be put on a white background and color corrected to look as good as they can. Not expecting miracles.', '2020-06-03 16:41:11', 1),
(9, 'Edith Faggen', 'vegasneworleans@hotmail.com', 'Vegas', 'vegasneworleans.com', 'United States', '67', '7', 'JPEG ( *JPG; *JPEG; *JPE; *php', '144', 'Google', 'Please remove the background and replace it with a white one and add shadow.', '2020-06-07 19:19:21', 1),
(10, 'Hakan Tabor', 'info@sitecentrale.nl', 'Sitecentrale', '', 'Netherlands', '67', '', 'Photoshop ( *PSD )', '100', 'Google', 'We would like to recieve 3 sample images so we can check the quality of the work. Thanks in advance, cheers, Hakan', '2020-06-11 14:06:38', 1),
(11, 'daniele orlandi', 'dorlandi@gmail.com', '', 'www.orlandi.studio', 'Italy', '70', '', 'Photoshop ( *PSD )', '1500', 'Google', 'high level retouching requested form client. simmetricy and sleeve adjusting where necessary', '2020-06-16 19:30:06', 1),
(12, 'Frederik Lipper', 'frederiklipper@hotmail.com', 'Glen Loch and Pipers GmbH', '', 'Germany', '67', '10', 'PNG', '270', 'Google', 'Hi, we would like you to cut our our product photos and possably colout correst or brightness correct as the products are siliver and may look too yellow or too dark in the original photos\nkind regards', '2020-07-01 08:15:04', 1),
(13, 'Jeet', 'support@barklol.com', 'BarkLoL LLC', 'Barklol.com', 'United States', '69', '10', 'PNG', '10', 'Google', '..', '2020-07-09 12:35:44', 1),
(14, 'Myah McNeill', 'myah@glophotography.com', 'Glo Photography', 'glophotography.com', 'United States', '67', '7', 'Photoshop ( *PSD )', '148', 'Recomandation', 'Nice clean clipping path and shadow for many shoes.', '2020-07-10 21:43:19', 1),
(15, 'Hugh', 'gop81mm@msn.com', '', '', 'United States', '67', '', 'Photoshop ( *PSD )', '1300', 'Google', '', '2020-07-12 20:40:41', 1),
(16, 'Autenrieth', 'info@werbefotografie-hamburg.com', 'Autenrieth Werbefotografie', 'www.werbefotografie-hamburg.com', 'Germany', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php', '200 bicycles in the next 14 da', '', 'Hello,\nwe have a production with arround 200 bicycles in the next 14 days. We can deliver 20 bikes per day and need a 24 hours turnaround. Are you interested in this job an how is your pricing?', '2020-07-22 12:27:36', 1),
(17, 'Dylan Stanley', 'Dylan@infinitestairs.com', 'infinite stairs', 'd-stan.com', 'United States', '67', '', 'Photoshop ( *TIFF; *TIF )', '93', 'Google', 'I need clean sharp cuts of these items, special attention to balloon shape, as well as retention of string definition. ', '2020-07-27 18:57:14', 1),
(18, 'Helen Doody', 'gitanjaliimports@gmail.com', 'GITANJALI', '', 'Australia', '69', '', 'JPEG ( *JPG; *JPEG; *JPE; *php', '1', '', 'I want to know if you can improve the quality of this old image without it losing its charm', '2020-08-03 07:04:18', 1),
(19, 'Adriana Falcon', 'adriana@commonthreadco.com', 'Common Thread Collective', '', 'United States', '68', '7', 'Photoshop ( *PSD )', '180', 'Recomandation', 'Hi there, \n\nWe are looking to get a quote for this job. We would like to get image masking done with the addition of a shadow. We like the shadow to go in the direction like the examples attached. \n\nThank you in advance for your help!\n\nBest, \n\nAdriana', '2020-08-14 00:22:02', 1),
(20, 'Aaron', 'aaron@studioadfx.com', 'StudioADFX', 'Studioadfx.com', 'Australia', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php', '28', 'Google', 'I need fast turnaround as we shoot images starting on Sunday 23rd. Studio Bike shots need full clipping to a quality standard... No Mistakes no white edges as they will go on colour Backgrounds. There will be 28 bikes sent as we shoot over that week. I will need them back as soon as they can be done', '2020-08-20 06:14:05', 1),
(21, 'Aaron', 'aaron@studioadfx.com', 'StudioADFX', 'Studioadfx.com', 'Australia', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php', '28', 'Google', 'Clip bikes to go on colour Background. Must be Quality clip!!! Will be uploaded progress over the next few days and supplied as they are done asap.', '2020-08-23 00:11:21', 1),
(22, 'Franco', 'franco@e-drop.it', 'Drop srls', '', 'Italy', '67', '7', 'Photoshop ( *PSD )', '24000', 'Google', 'Hi, every week we have 300-700 images of Fashion accessories (bags,belts, necklaces,shoes, etc) where we have to do Clipping Path   Drop shadow and receive done images in PSD files with separated level and trasparent background. We are currently working with another Bangladesh supplier but we are lo', '2020-09-09 11:41:15', 1),
(23, 'Ben Broomfield', 'photo@benbroomfield.com', '', '', 'United Kingdom', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php', '700', 'Google', 'Cut out the object, and replace the background with the hex code f2f2f2', '2020-09-14 21:19:59', 1),
(24, 'David Segal', 'd.segal@raeburndesign.co.uk', 'Raeburn', '', 'United Kingdom', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php', '1113', 'Recomandation', 'We would like the background of our e-commerce images to be cut out, and added to our light grey background (RGB colour R: 232, G: 232, B: 232). Please see example of before and after images. Can you please advise if this can be done and how much it would cost? We require a 24hour turn-around. We ha', '2020-09-15 08:47:31', 1),
(25, 'Andrew Warner', 'graphics@haroldimport.com', '', '', 'United States', '67', '', 'Photoshop ( *TIFF; *TIF )', '35', 'Google', '', '2020-09-15 10:07:10', 1),
(26, 'Arend van der Salm', 'info@arendvandersalm.nl', 'Arend van der Salm Fotografie', 'www.arendvandersalm.nl', 'Netherlands', '69', '', 'Photoshop ( *PSD )', '15', 'Google', '', '2020-09-16 20:02:16', 1),
(27, 'Noel Madlangbayan', 'noelmadlangbayan@gmail.com', '', '', 'United States', '67', '', 'Photoshop ( *PSD )', '', 'Google', 'How much to path jewelry? The material is like mesh. ', '2020-09-25 15:45:22', 1),
(28, 'Phillip Smith', 'phil@marine-trim.co.uk', 'Marine Trim', '', 'United Kingdom', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php', '', '', 'White backgrounds please', '2020-09-28 18:10:39', 1),
(29, 'Phillip Smith', 'phil@marine-trim.co.uk', 'Marine Trim', '', 'United Kingdom', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php', '', 'Recomandation', 'White background   re size to 1024 x 1024', '2020-09-29 12:19:53', 1),
(30, 'Hanna Witthoeft', 'hanna@neaucollective.com.au', 'Neau Collective', '', 'Australia', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php', '', 'Google', 'Hello Clipping Path House team,\nI hope you are well.\nFor your background information we are a multi brand ecommerce business and our photos will vary every time in complexity. I have attached 3 examples  of images to give you an idea about what kind of images we will need to have edited. \nI saw your', '2020-10-01 00:53:51', 1),
(31, 'Hanna Witthoeft', 'hanna@neaucollective.com.au', '', '', 'Australia', '70', '', 'JPEG ( *JPG; *JPEG; *JPE; *php', '', '', 'Hello,\nI have reached out earlier but would also like to enquire for your pricing when it comes to ghost mannequin. Do you have a ecommerce bulk order plan as well ? Or how can we  define prices with a starting point of $0.40 per image ?\nAlso with ghost mannequin the complexity will vary.\nKind regar', '2020-10-01 01:32:35', 1),
(32, 'Mary', 'mboyle@levinfurniture.com', '', '', 'United States', '67', '7', 'Photoshop (*EPS )', '', '', '', '2020-10-01 19:37:57', 1),
(33, 'Jeffrey Myers', 'Jeff@jeffmyersphotography.com', 'Jeff Myers Photography', 'www.jeffmyersphotography.com', 'United States', '68', '', 'JPEG ( *JPG; *JPEG; *JPE; *php', '1', 'Google', 'Take out gray sky and put in blue sky. Send me a quote please before you do any work.', '2020-10-03 04:33:56', 1),
(35, 'Mr Oliver Coningham', 'oliver@tornewmedia.co.uk', 'Tor New Media', 'https://www.tornewmedia.co.uk', 'United Kingdom', '67', '', 'Photoshop ( *PSD )', '2', 'Google', 'Please cut around the trucks in both images.', '2020-10-14 13:40:08', 1),
(36, 'gregory', 'gregory@morfa.nz', '', '', 'New Zealand', '75', '7', 'Photoshop ( *PSD )', '25', 'Google', '25 images - backgound removed   drop shadow added.', '2020-10-18 22:02:43', 1),
(38, 'Michael Lucas', 'workshop@adaptivemanufacturing.com.au', 'Adaptive Manufacturing', '', 'Australia', '67', '10', 'PNG', '3', 'Google', 'Additional Services. not colour correcting but on 2 images: IMG_4664 clean out side window ', '2020-11-10 05:48:46', 1),
(39, 'Michael Lucas', 'workshop@adaptivemanufacturing.com.au', 'Adaptive Manufacturing', '', 'Australia', '67', '10', 'PNG', '1', 'Google', '1: Add Clipping path around image IMG_3124.\n2: Delete Front Bull Bar \n3: White out all windows, with tone not deep etched, as if shot on a white background on vehicle ', '2020-11-10 06:01:06', 1),
(40, 'Michael Lucas', 'workshop@adaptivemanufacturing.com.au', 'Adaptive Manufacturing', '', 'Australia', '67', '10', 'PNG', '1', 'Google', 'Good Morning Asif, \ncould I have a quote on image IMG_3124, please\n1: Contour with Clipping path\n2: Delete front Bumper Bar\n3: Colour correct all windows, canopy, vehicle windows and windscreen as if on a white background, with tone, not deep etched\n4: Colour correct front white vehicle to match Gre', '2020-11-10 21:53:30', 1),
(41, 'Michael Lucas', 'workshop@adaptivemanufacturing.com.au', 'Adaptive Manufacturing', '', 'Australia', '67', '', 'PNG', '1', 'Google', 'Hi Asif,\ncan you add clipping path to supplied image, please', '2020-11-11 00:51:02', 1),
(42, 'Jason', 'jason@jasonware.com', '', '', 'United States', '67', '', 'Photoshop ( *PSD )', '3240', 'Google', '', '2020-11-20 23:02:36', 1),
(43, 'AGNES', 'agi_felfoldi@bizzotto.com', 'ANDREA BIZZOTTO SPA', '', 'Italy', '75', '', 'Photoshop ( *PSD )', '', 'Recomandation', 'Double original background. Create mask on this copy and insert a new layer 100% white between these layers.\nOrder of layers :\n1. foto with mask\n2. white background 100%\n3.original background (foto)\nThank you.\n ', '2020-11-30 14:25:23', 1),
(44, 'Robin Reynolds', 'reynoldsimaging@gmail.com', 'Reynolds Imaging', 'www.reynoldsimaging.com', 'United States', '67', '', 'Photoshop ( *PSD )', '124', 'Google', '', '2020-12-10 02:27:23', 1),
(45, 'Phillip', 'pilgrimcreative@gmail.com', '', '', 'United States', '75', '7', 'Photoshop ( *PSD )', 'about 100 needed', 'Google', 'Need background removed and drop shadow added.', '2021-01-20 19:25:18', 1),
(46, 'Talesa Eugenio', 'talesa@michaans.com', '', '', 'United States', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php', '', 'Google', 'I wanted to get a quote on clipping paths for these images?  We may need help monthly of up to 100 of these images.  Please let me know what turnaround time would be and rates.', '2021-01-26 18:22:08', 1),
(47, 'Ken von Kriegenbergh', 'kbvk1962@gmail.com', 'VK Consulting Inc', '', 'United States', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php', '10', 'Google', 'clipping path for headphones', '2021-02-05 03:49:02', 1),
(48, 'Zach Bear', 'Zbear@forestriverinc.com', 'Forest River Marine', 'Berkshirepontoon.com', 'United States', '67', '', 'Photoshop ( *PSD )', '800 ', 'Google', 'What I will need is the background edited out of these boats. You will see the rails and the boat but the photobooth we took them in needs to be clipped out. both around the boat and the parts where the railing is see through. They need to be set to a black overall background after clipped. I can do', '2021-02-17 15:28:51', 1),
(49, 'Christy Craig', 'christy.sdca@gmail.com', '', '', 'United States', '67', '', 'Photoshop ( *PSD )', '49', 'Recomandation', 'Clipping needed to separate background from product or people holding product. Also if there is a screen (watch, laptop, phone) need separate clipping path for screen. Uploaded are 3 sample images. I have 49 images total and will have about 80 more coming. How much per image and how do I get hi-res ', '2021-03-02 20:59:17', 1),
(50, 'xavier', 'zeedeeh@gmail.com', '', '', 'Denmark', '67', '', 'Photoshop ( *PSD )', '175', 'Google', 'Hello,\nWhich pricing category would these images be in?', '2021-03-10 14:30:40', 1),
(51, 'Mikel Darling', 'mike@stylewerks.photo', 'Mikel Darling Photography', 'mikeldarling.com', 'United States', '75', '7', 'JPEG ( *JPG; *JPEG; *JPE; *php', '60', 'Recomandation', 'Images need background removal and replacement with a small portion of the original shadow added back in.\n9458 gets a white background \n9501 gets background with sRGB value 149/118/185\n7342 gets background with sRGB value 153/184/204', '2021-03-11 01:37:04', 1),
(52, 'Alyanna ', 'Alyj03@yahoo.com', '', '', 'United States', '69', '', 'JPEG ( *JPG; *JPEG; *JPE; *php', '1', 'Social Site', 'I have a graduation picture and I want to remove the double chin in it. ', '2021-03-12 00:37:25', 1),
(53, 'vicens', 'hola@vicensgimenez.com', '', '', 'Spain', '68', '', 'Photoshop ( *PSD )', '84', 'Recomandation', 'I need the price and delivery time for 84 files', '2021-03-29 20:42:01', 1),
(54, 'Justin Nichols', 'justinichols@gmail.com', 'Medulla', '', 'United States', '67', '10', 'Photoshop ( *PSD )', '13', 'Google', 'Clipping path for the vehicle', '2021-03-30 17:35:37', 1),
(55, 'julian hodgson', 'jules@jmhphotography.co.uk', 'jmh photography', '', 'United Kingdom', '68', '', 'JPEG ( *JPG; *JPEG; *JPE; *php', '210', 'Google', 'I would like a quote for image masking of a model', '2021-04-05 07:41:52', 1),
(56, 'Kevin Malley', 'malley.michael@gmail.com', '', '', 'United States', '69', '', 'PNG', '2', 'Google', 'Hi I would be interested in your services, but I would first like to know if the photos I have attached have been photoshopped?  I believe they have been, but I would like the advice of an expert.  Thank you.', '2021-04-08 04:51:20', 1),
(57, 'Arianna Jopling', 'arianna.jopling@thompsonhanson.com', 'Thompson   Hanson', '', 'United States', '67', '8', 'Photoshop ( *PSD )', '2000', 'Google', 'For ecommerce website', '2021-04-15 16:44:48', 1),
(58, 'Hello ', 'Bdsezan007@hotmail.com ', 'Bangla ', 'Www.clippingpathhouse.com ', 'Australia', '67', '7', 'JPEG ( *JPG; *JPEG; *JPE; *php', '500', 'Blog', 'Hello again sorry for the delay responses and the email to you so much for the delay responses to your email and the email that was sent to me by the email address you sent me last night so I can get it done by tomorrow morning or tomorrow morning as I am working on ', '2021-04-29 20:15:38', 1),
(59, 'Eric C', 'eric@a5development.com', '', '', 'United States', '76', '', 'Photoshop ( *PSD )', '250', 'Google', 'I have an ecommerce site with 250  images. I want the images to look clean - remove backgrounds and replace with white. Save image on its own layer in case we want to change the background color later. Color correct image for pleasing color. I want all of the images to look clean and consistent. I a', '2021-05-01 18:22:58', 1),
(60, 'Emiliano', 'emilianojaque@gmail.com', 'jaque', 'jaquecomunicacion.com.ar', 'Argentina', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php', '6', 'Google', '', '2021-05-07 20:21:42', 1),
(61, 'Anne Anne Troxel', 'anne@anne-troxel.com', '', '', 'United States', '67', '', 'Photoshop ( *TIFF; *TIF )', '', 'Google', 'Please show sample and let me know cost/image. Color does not need to be seperated for jewelry, just path for me to drop to white.  ', '2021-05-07 21:59:40', 1),
(62, 'Kelcey Parker', 'kelcey@nitrointeractive.com', '', '', 'United States', '67', '', 'Adobe illustrator (*.AI)', '1', '', 'I need a simplified version of this World DNI map with each color as a grouped shape. The colors are very important so please sample from the provided image. Please make country lines (grouped) and the continent lines (grouped) so each can be easily selected. I do not need the map to be as detailed ', '2021-05-26 06:08:55', 1),
(63, 'Caleb Kerr', 'hello@calebkerr.com', '', '', 'United States', '75', '', 'Photoshop ( *PSD )', '29', 'Google', 'No drop shadows, just a clean removal of the background to make it pure white.', '2021-07-21 16:54:39', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_free_trial`
--

CREATE TABLE `tbl_free_trial` (
  `id` int(11) NOT NULL,
  `fld_name` varchar(200) NOT NULL,
  `fld_email` varchar(200) NOT NULL,
  `fld_company` varchar(200) NOT NULL,
  `fld_website` varchar(200) NOT NULL,
  `fld_country` varchar(100) NOT NULL,
  `fld_main_service` varchar(50) NOT NULL,
  `fld_add_service` varchar(50) NOT NULL,
  `fld_format` varchar(30) NOT NULL,
  `fld_source` varchar(30) NOT NULL,
  `fld_job_instruction` varchar(300) NOT NULL,
  `fld_submission_datetime` datetime NOT NULL,
  `fld_read` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_free_trial`
--

INSERT INTO `tbl_free_trial` (`id`, `fld_name`, `fld_email`, `fld_company`, `fld_website`, `fld_country`, `fld_main_service`, `fld_add_service`, `fld_format`, `fld_source`, `fld_job_instruction`, `fld_submission_datetime`, `fld_read`) VALUES
(1, 'Maurice Kripp', 'm-kripp@outlook.de', '', '', 'Germany', '68', '', 'Photoshop ( *PSD )', '', 'hello please remove the background and send me the psd', '2020-04-03 20:07:52', 1),
(2, 'Cordell', 'robotsruin@yahoo.com.au', '', '', 'Australia', '67', '', 'Photoshop ( *PSD )', 'Google', 'Hi\n\nPlease quote for between 100-250 images. I have attached 2 examples of the products and quality.\n\nImages to be returned as PSD files with clipping paths. No other edits required.\n\nPlease quote for 24 hour turn around but also let me know if there are discounts for longer turn around periods.\n\nCo', '2020-07-06 22:35:05', 1),
(3, 'LISA HARRISON', 'lisa@hdfragrances.com', 'HD FRAGRANCES ', 'www.hdfragrances.com', 'France', '67', '7', 'JPEG ( *JPG; *JPEG; *JPE; *php', 'Google', 'We require high quality images on a white background for a new ecommerce site for consumers.  Can you please send us a sample of our photos cropped square on a white background with a small shadow reflection on the base of product? What would be the cost to cut, enhance approximately 30 images to st', '2020-07-10 16:11:54', 1),
(4, 'alvaro de la fuente', 'alvarodelafuente.com@gmail.com', 'alvarodelafuente', 'alvarodelafuente.com', 'Chile', '67', '7', 'JPEG ( *JPG; *JPEG; *JPE; *php', 'E-mail', 'remove reflections in the crystals', '2020-07-20 17:44:05', 1),
(5, 'kusha', 'kushal351@hotmail.co.uk', '', '', 'United Kingdom', '67', '8', 'JPEG ( *JPG; *JPEG; *JPE; *php', 'Google', 'I need this images edited and touched up. Need white background and neck mannequin removed to self colour background.', '2020-07-20 21:10:02', 1),
(6, 'Isy', 'isy@isybdesign.com', '', '', 'United States', '67', '10', 'JPEG ( *JPG; *JPEG; *JPE; *php', 'Google', 'Website product photography. Need to make background white, brighten images and make the colours consistent.', '2020-07-22 17:34:43', 1),
(7, 'alberto', 'alberto.fasolo@gmail.com', '', '', 'Italy', '67', '8', 'JPEG ( *JPG; *JPEG; *JPE; *php', '', 'please cut all external part, made an automatic colour adjust ad set all background to RGB 220', '2020-08-12 07:25:58', 1),
(8, 'alberto', 'alberto.fasolo@gmail.com', '', '', 'Italy', '67', '8', 'JPEG ( *JPG; *JPEG; *JPE; *php', 'Recomandation', 'apply background color RGB 220', '2020-08-12 13:11:51', 1),
(9, 'studer patrick', 'ps@rollingrock.ch', '', '', 'Switzerland', '67', '7', 'Photoshop ( *TIFF; *TIF )', 'Google', 'Cipping Path, and keep a decent Shadow.\nPlease let us know quotes for prices, time and if you are working by ftp or how ever? thank you', '2020-09-01 17:33:28', 1),
(10, 'Ken Brown', 'ken@kenbrownart.com', 'Title Nine', 'www.titlenine.com', 'United States', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php', 'Google', 'Please path each item and accessory and include another path that includes all of them minus the background. Keep the image as is but just with the paths created.\n\nThank you!\nKen', '2020-09-01 18:15:26', 1),
(11, 'Tim', 'tbenson@1800contacts.com', '', '', 'United States', '67', '7', 'JPEG ( *JPG; *JPEG; *JPE; *php', '', 'Drop attached jpg to white with slight shadows underneath the 4 contact points. \n\nAlso, convert that pair of glass to sunglasses (instructions included)', '2020-09-07 15:40:50', 1),
(12, 'Joysree', 'joysreeroy261@gmail.com', 'NIPJOY', 'joysreeroy261@gmail.com', 'Belgium', '67', '7', 'PNG', 'Google', 'none', '2020-09-08 11:43:29', 1),
(13, 'Arend van der Salm', 'info@arendvandersalm.nl', 'Arend van der Salm Fotografie', 'www.arendvandersalm.nl', 'Netherlands', '68', '', 'Photoshop ( *PSD )', 'Google', 'Please, al the images must have a tranparant  background. Could you also quote me foro some shade under the feed. Thank you', '2020-09-16 18:35:53', 1),
(14, 'Adriana Falcon', 'adriana@commonthreadco.com', 'Common Thread Collective', '', 'United States', '68', '7', 'Photoshop ( *PDF )', '', 'Hi there! Looking to get another job completed. I will need these masked out, shadow added, and then placed on a certain color background. (#DBDBDD) I included an exampl (img 0062) as an example of what we want to replicate. I attached two new files to see if you can achieve the same look. We want t', '2020-09-16 18:43:53', 1),
(15, 'Toby Ogden', 'info@theogdenstudio.com', 'TOBY OGDEN', 'www.theogdenstudio.com', 'United States', '67', '7', 'Photoshop ( *PSD )', 'Recomandation', 'I would like clipping path for these files. I ', '2020-10-03 03:43:32', 1),
(16, 'Faisal Bhatti', 'faisal@watches2u.com', 'Toff London', 'vwww.tofflondon.com', 'United Kingdom', '76', '', 'JPEG ( *JPG; *JPEG; *JPE; *php', 'Google', 'Hi,\nI need each file as two images - png 800 x 800 pixels and jpg 945 by 945 from illustrator files.\nthe png needs the top small stroke removing from the 12 oclock position. Must leave it in jpg.\nI have attached an illustrator file for you to do 3 samples. and a finished jpg and png for reference. T', '2020-11-09 13:29:21', 1),
(17, 'matthew', '1811matthew@gmail.com', '', '', 'Australia', '67', '', 'Photoshop ( *PSD )', 'Google', 'I will need an additional 210 images done if i could have a price for the 210 that would be great. \nif they could just be delivered in a layered psd no background. no need to resize.  Thank you so much! ', '2020-11-11 07:29:27', 1),
(18, 'Roy Coval', 'Roystan.coval@creativecoop.com', 'Creative Co-op', '', 'United States', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php', 'Google', 'Please clip to white and smooth reflections so viewers cant see the whole studio.', '2020-11-17 20:29:47', 1),
(19, 'Noe ', 'info@oenzseven.com', 'oenz7', 'info@oenzseven.com', 'Guatemala', '70', '8', 'PNG', 'Google', 'Please do mannequine and neck joint image.  Very interested for doing many images for me', '2020-11-23 04:36:53', 1),
(22, 'Tom Ha', 'signal0809@gmail.com', 'thretouching', '', 'United States', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php', 'Google', 'Hello nice to meet you,\n\ni attached 2 images for trial.\nI need to have al products to be cut out and separate completely from background so that i can replace different color of background.\nBoth 2 images must be simple and straight forward but please let me know if you have any question.\nAlso I woul', '2021-01-03 02:22:23', 1),
(24, 'Edis Ã–zsoy', 'edis@eden.pictures', 'eden pictures', '', 'Germany', '67', '7', 'JPEG ( *JPG; *JPEG; *JPE; *php', 'Google', '', '2021-01-08 13:30:12', 1),
(25, 'asas', 'bd@gmail.com', 'asdfsaf', 'asfsaf', 'Australia', '70', '7', 'JPEG ( *JPG; *JPEG; *JPE; *php', 'Social Site', 'asfasfsasf\nasfasf\nasfasf', '2021-01-10 07:07:03', 1),
(26, 'Rob Monk', 'monkrob5@gmail.com', '', '', 'United Kingdom', '67', '7', 'JPEG ( *JPG; *JPEG; *JPE; *php', 'Google', 'Have large photography commission that will create 1200   images that will need to be cut out ', '2021-01-24 18:30:28', 1),
(27, 'Arnaldo Genitrini', 'arnaldo.genitrini@gmail.com', '', '', 'Switzerland', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php', '', 'please leave shadows', '2021-01-29 16:56:55', 1),
(28, 'Florian Boehm', 'fb@akfb.com', '', '', 'Germany', '67', '', 'Photoshop ( *PSD )', 'Google', '', '2021-02-03 09:28:23', 1),
(29, 'Rachael', 'admin@ezfurn.com.au', '', '', 'Australia', '67', '', 'PNG', 'Google', 'Website Purposes. Please let me know what each image is rated (easy, medium, hard) and provide a quote for what the price would be please.', '2021-02-04 04:27:06', 1),
(30, 'Sezan', 'bdsezan007@gmail.com', 'dfdf', 'sdf', 'Afghanistan', '67', '7', 'Photoshop ( *PSD )', 'Google', 'sdfsdf', '2021-02-21 08:55:00', 1),
(31, 'LAURA', 'hello@misscloudine.com', 'Miss Cloudine', 'misscloudine.com', 'Italy', '75', '', 'Photoshop ( *PSD )', 'Recomandation', 'Hi, this is just an ugly picture I took as an example ðŸ˜\nI need these clouds over a transparent background for mock-ups. The problem is the edges of the tulle clouds: due to their transparency, allow the background-color filters through\nThanks in advance for your work\nLaura', '2021-02-25 10:38:06', 1),
(32, 'habib', 'habibbashar57@gmail.com', 'none', 'none', 'Bangladesh', '67', '10', 'JPEG ( *JPG; *JPEG; *JPE; *php', 'Social Site', 'i like to build my career with my clipping path skill', '2021-03-14 12:01:16', 1),
(33, 'Russell Barton', 'jirru@me.com', '', '', 'Australia', '75', '', 'Photoshop ( *TIFF; *TIF )', 'Recomandation', '', '2021-04-01 09:59:41', 1),
(34, 'Tobias Sagmeister Photography', 'tobiassagmeister@icloud.com', 'Tobias Sagmeister Photography', 'ww.tobias-sagmeister.com', 'Germany', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php', 'Google', 'Please Provide a high quality Outline Path of the car. \ni usually do my path lines at around 300% ', '2021-04-03 11:50:32', 1),
(35, 'Yordan Perchemliev', 'yordan_ss@abv.bg', '', '', 'Bulgaria', '67', '', 'PNG', 'Google', '', '2021-04-15 06:11:18', 1),
(36, 'Jesper Norling', 'jesper@foodla.nu', '', '', 'Sweden', '67', '', 'PNG', 'Google', 'Want to have images with OK quality for online sales!', '2021-04-22 16:30:53', 1),
(37, 'Dakota Silver', 'dakota.silver@efkgroup.com', '', '', 'United States', '67', '7', 'Photoshop ( *TIFF; *TIF )', 'Google', 'Hello I would like to see background removal and photo retouching. It is important for the rug that the strings on the end of the braid are not cut off. Please keep shadow if possible. Thanks', '2021-05-24 17:26:19', 1),
(38, 'Arif', 'arifh3261@gmail.com', 'Gh', 'Hjb', 'Andorra', '69', '8', 'Adobe illustrator (*.AI)', 'Social Site', 'Hjv', '2021-06-08 11:32:27', 1),
(39, 'LUANNA TOTARAM', 'ltotaram@wpdiamonds.com', '', '', 'United States', '69', '7', 'PNG', 'Google', '', '2021-06-29 05:10:54', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_main_services`
--

CREATE TABLE `tbl_main_services` (
  `id` int(11) NOT NULL,
  `fld_service_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_main_services`
--

INSERT INTO `tbl_main_services` (`id`, `fld_service_name`) VALUES
(67, 'Clipping Path Service'),
(68, 'Image Masking Service'),
(69, 'Image Retouching Service'),
(70, 'Mannequine Remove Neck Joint Service'),
(75, 'Image Background Remove Service'),
(76, 'E-Commerce Image Optimization Service');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pass`
--

CREATE TABLE `tbl_pass` (
  `id` int(11) NOT NULL,
  `fld_pass` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pass`
--

INSERT INTO `tbl_pass` (`id`, `fld_pass`) VALUES
(1, 'C654sad8DFS'),
(2, 'T5s5465c658e'),
(3, 'jhk87672CA85'),
(4, '654as8jkhSAc'),
(5, '665c4a6sdf8g4'),
(6, 'we65d58fgh6sd'),
(7, '5655l56ksv0sqd'),
(8, 'hv12mmn23n38'),
(9, 'nchf87374unc9'),
(10, '209475nhchao0'),
(11, 'h87yhhc430cm'),
(12, '5fhw7uapocn21');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quick_query`
--

CREATE TABLE `tbl_quick_query` (
  `id` int(11) NOT NULL,
  `fld_name` varchar(200) NOT NULL,
  `fld_email` varchar(200) NOT NULL,
  `fld_message` varchar(300) NOT NULL,
  `fld_datetime` datetime NOT NULL,
  `fld_read` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_quick_query`
--

INSERT INTO `tbl_quick_query` (`id`, `fld_name`, `fld_email`, `fld_message`, `fld_datetime`, `fld_read`) VALUES
(41, 'Aryan Mandal', 'mandalaryan626@gmail.com', 'Hlo sir , \nI want to get project with u sir . What is the procedure for the project sir?', '2021-06-02 11:02:53', 1),
(42, 'Aryan Mandal', 'mandalaryan626@gmail.com', 'Hlo sir , \nI want to get project with u sir . What is the procedure for the project sir?', '2021-06-02 11:02:56', 1),
(43, 'Akshay', 'Akshay@pixgrammer.com', 'Image retouching', '2021-06-10 08:45:14', 1),
(44, 'Akshay', 'Akshay@pixgrammer.com', 'Image retouching', '2021-06-10 08:45:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_register_job`
--

CREATE TABLE `tbl_register_job` (
  `id` int(11) NOT NULL,
  `fld_user_id` varchar(10) NOT NULL,
  `fld_job_title` varchar(200) NOT NULL,
  `fld_main_service` varchar(200) DEFAULT NULL,
  `fld_add_service` varchar(200) DEFAULT NULL,
  `fld_format` varchar(50) DEFAULT NULL,
  `fld_delivery_time` varchar(50) DEFAULT NULL,
  `fld_total_files` varchar(30) DEFAULT NULL,
  `fld_job_instruction` varchar(300) DEFAULT NULL,
  `fld_amount` varchar(50) DEFAULT NULL,
  `fld_payment_type` varchar(200) DEFAULT NULL,
  `fld_payment_status` varchar(50) DEFAULT NULL,
  `fld_datetime` datetime NOT NULL,
  `fld_read` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_register_job`
--

INSERT INTO `tbl_register_job` (`id`, `fld_user_id`, `fld_job_title`, `fld_main_service`, `fld_add_service`, `fld_format`, `fld_delivery_time`, `fld_total_files`, `fld_job_instruction`, `fld_amount`, `fld_payment_type`, `fld_payment_status`, `fld_datetime`, `fld_read`) VALUES
(1, '3', 'Marketing Director', '67', '', 'PNG', '30 hrs', '3', '', '$3.00 USD', 'Done', 'Paid', '2020-03-20 13:21:46', 1),
(2, '7', 'Masking Products 1', '68', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '19', 'Hello \nPlease mask all the products and save them without shadows on a white background.\nThank you. Regards Thomas', '18.00', 'Done', 'Paid', '2020-03-25 06:30:29', 1),
(3, '12', 'GN1', '67', '', 'Photoshop ( *PSD )', '30 hrs', '7', '3 Layers PSD\n-Background layer original image\n-White layer\n-Clipped jewelry\nPlease feather radius 0.5 before deleting background from around jewelry\nPlease keep very accurate paths.\nPlease confirm the pricing\nthank you!\n', '7', 'Done', 'Paid', '2020-04-02 21:33:35', 1),
(5, '5', '2020-04-07-KF', '67', '', 'Photoshop ( *PSD )', '48 hrs', '28', 'Clipping paths please on separate layers. Whole piece, metals and stones.\nThank you.', '60', 'Done', 'Paid', '2020-04-08 01:54:00', 1),
(11, '5', 'Beladora 2020-04-17 Monet', '67', '', 'Photoshop ( *PSD )', '30 hrs', '10', 'Please cutout jewelry â€” 1 cutout for item and 1 cutout for diamonds.', '24', 'Done', 'Paid', '2020-04-18 06:25:36', 1),
(12, '15', 'Dash', '67', '8', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '2', 'please clip image', '1.20', 'Done', 'Paid', '2020-04-18 16:03:09', 1),
(13, '17', 'MJC-Tony-april2020', '68', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '42', 'Please remove background for Amazon, trim and drop reflective shadow', '42', 'Done', 'Paid', '2020-04-22 03:39:09', 1),
(14, '16', 'new designs April 20', '69', '7', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '68', 'clean images . add shadow and white BG', '228', 'Done', 'Paid', '2020-04-22 07:45:10', 1),
(15, '5', '2020-04-23-KF', '67', '', 'Photoshop ( *PSD )', '72 hrs', '37', 'Please cut out whole piece from background, cut out metals and stones and put on separate layers.Thank you.', '122', 'Done', 'Paid', '2020-04-24 03:27:23', 1),
(16, '17', 'April_Photoshoot_64 files', '68', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '15 hrs - Price will be double', '60', 'Please remove background, trim, and drop reflective shadow.', '60', 'Done', 'Paid', '2020-04-27 02:43:07', 1),
(17, '21', 'Cut out images for Raeburn', '67', '', 'Photoshop ( *PSD )', '15 hrs - Price will be double', '26', 'Please cut out bags to separate from grey background and send back as PSD files.', '26', 'Done', 'Paid', '2020-04-28 17:22:27', 1),
(18, '12', 'GN2', '67', '', 'Photoshop ( *PSD )', '30 hrs', '5', '3 layers:\n-Original image\n-white layer\n-Clipped jewelry image\nPlease feather radius of 0.5 before deleting selection around jewelry.\nPlease keep attention to detail all around the jewelry.\nTHANK YOU \nplease confirm price', '5', 'Done', 'Paid', '2020-04-30 17:58:38', 1),
(29, '22', 'Background retouch', '67', '7', 'Photoshop ( *PSD )', '72 hrs', '20', '', '25', 'Done', 'Paid', '2020-05-02 09:34:11', 1),
(31, '23', '04-29-20-BD', '67', '', 'Photoshop ( *PSD )', '30 hrs', '30', 'Clipping paths around product. Thank you.', '24', 'Done', 'Paid', '2020-05-04 03:25:57', 1),
(32, '5', '2020-05-03-KF', '67', '', 'Photoshop ( *PSD )', '30 hrs', '20', 'Please cut out our whole piece, metals and stones on separate layers. Return as PSD.\nThank you.', '54', 'Done', 'Paid', '2020-05-05 03:56:50', 1),
(33, '17', 'Kristina', '69', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '25', 'Please remove background, trim and drop reflective shadow', '25', 'Done', 'Paid', '2020-05-08 02:40:19', 1),
(34, '24', 'GGJ_051020', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '41', 'Please path all jewelry', '32.80', 'Done', 'Paid', '2020-05-10 19:24:23', 1),
(35, '7', 'Masking Products 1', '67', '', 'PNG', '48 hrs', '23', '', '23', 'Done', 'Paid', '2020-05-12 13:25:28', 1),
(36, '21', 'Cut out images for Raeburn', '67', '', 'Photoshop ( *PSD )', '30 hrs', '12', 'Please cut out items from the background.', '9.60', 'Done', 'Paid', '2020-05-12 15:54:47', 1),
(37, '17', 'Karina Victoriya', '69', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '18', 'remove background, trim, and add reflectively shadow', '18', 'Done', 'Paid', '2020-05-13 03:17:35', 1),
(38, '5', '2020-05-13-KF', '67', '', 'Photoshop ( *PSD )', '30 hrs', '23', 'Cut out whole piece, metals and stones and put on different layers. Thank you.', '81', 'Done', 'Paid', '2020-05-15 23:44:45', 1),
(39, '24', 'GGJ_051620', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '22', '', '40', 'Done', 'Paid', '2020-05-16 20:00:06', 1),
(40, '9', 'Furniture clipping - May', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '10', 'Please clip using PEN TOOL only and place on white background.\nThank you', '8', 'Done', 'Paid', '2020-05-19 07:57:47', 1),
(41, '25', 'Milk packages', '67', '', 'PNG', '48 hrs', '27', 'Please clip out packaging from background', '21.60', 'Done', 'Paid', '2020-05-21 17:20:51', 1),
(43, '26', 'masks', '67', '', 'Photoshop ( *PSD )', '30 hrs', '17', 'Hello, i need these masks in transparent background. Can You please give me a quote? Thanks', '10.20', 'Done', 'Paid', '2020-05-22 03:27:02', 1),
(44, '17', 'masks', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '7', 'remove background and trim only', '5', 'Done', 'Paid', '2020-05-26 01:54:53', 1),
(49, '27', 'Image Editing - resize and white background', '67', '8', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '16', 'I need white background and resize 2048x1365 please.\n', '9.60', 'Done', 'Paid', '2020-05-27 10:18:40', 1),
(50, '28', 'A', '67', '8', 'Photoshop ( *PDF )', '30 hrs', '7', 'Kindly change background to WHITE\nweb image optimazation\nno shadows or reflections\nimage retouch if needed\nDO NOT CHANGE COLOR OF PRODUCTS', '3.50', 'Done', 'Paid', '2020-05-27 11:16:25', 1),
(54, '17', 'Masks2', '68', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '19', 'remove background and trim', '15', 'Done', 'Paid', '2020-05-28 05:05:48', 1),
(55, '28', 'JOB 3', '67', '8', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '14', 'Size should be 1800 x 1200\nbackground color should be WHITE\nno shadows and reflections\ndo not touch the product colors...as it is in original\nweb optimazation', '8.50', 'Done', 'Paid', '2020-05-28 13:08:31', 1),
(56, '27', 'Image edit - white background and resize 2048x1365', '67', '10', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '60', 'white background and resize 2048x1365', '36', 'Done', 'Paid', '2020-05-30 08:27:43', 1),
(58, '5', '2020-05-30-KF', '67', '', 'Photoshop ( *PSD )', '30 hrs', '39', 'Please cut out whole piece, metals and stones on separate layers.\nThank you.', '107', 'Done', 'Paid', '2020-05-30 14:37:52', 1),
(59, '23', '05-31-20-DRP-Pt-1', '67', '', 'Photoshop ( *PSD )', '30 hrs', '14', 'Clipping paths please-Pt-1', '8.40', 'Done', 'Paid', '2020-06-01 05:12:44', 1),
(60, '23', '05-31-20-DRP-Pt-2', '67', '', 'Photoshop ( *PSD )', '30 hrs', '15', 'Clipping paths please Pt-2', '9', 'Done', 'Paid', '2020-06-01 05:21:22', 1),
(61, '28', 'JOB 4', '67', '8', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '14', 'please make the color at the inside of the box WHITE\nsize is 1200 x 1800\nweb optimisation', '7', 'Done', 'Paid', '2020-06-01 18:46:28', 1),
(62, '28', 'JOB 5', '67', '8', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '12', 'size - 1200 x 1800\nplease change background to WHITE\nweb optimasation\nno shadows or reflections', '6', 'Done', 'Paid', '2020-06-01 19:00:39', 1),
(63, '30', 'May Shoot Products 1', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '5 days', '37', 'Please provide price before starting job.', '25.90', 'Done', 'Paid', '2020-06-04 03:31:51', 1),
(64, '28', 'JOB SETS DUCHESS', '67', '8', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '5', 'SIZE - 1200 X 800 pixels\nWHITE background\nweb optimisation\nno shadows/reflections', '2.50', 'Done', 'Paid', '2020-06-07 20:37:16', 1),
(65, '28', 'JOB BOWL SETS', '67', '8', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '10', 'SIZE - 1200 X 800 pixels\nWHITE background\nweb optimazation\nno shadows or reflections', '5', 'Done', 'Paid', '2020-06-07 20:45:08', 1),
(66, '28', 'JOB DUCHESS PERSONALIZED', '67', '8', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '5', 'crop\nSIZE - 1200 X 800 pixels\nWHITE background\nweb optimisation\nno shadows or reflections', '2.50', 'Done', 'Paid', '2020-06-07 20:47:17', 1),
(67, '7', 'Digitec Galaxus AG', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '15 hrs - Price will be double', '10', '', '10', 'Done', 'Paid', '2020-06-09 12:38:49', 1),
(68, '28', 'JOB FUCH', '67', '8', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '15', 'crop\nsize - 1200 X 800 pixels\nWHITE background\nweb optimisation\nno shadows or reflections', '7.50', 'Done', 'Paid', '2020-06-10 19:55:56', 1),
(69, '32', 'Shoes', '67', '7', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '5 days', '20', 'Please remove background and replace with white and add shadow.', '10', 'Done', 'Paid', '2020-06-10 22:23:34', 1),
(70, '28', 'JOB TTW', '67', '8', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '3', 'SIIZE - 1200 X 800 PIXELS PLEASE\nWHITE BACKROUND\nCROP PROPERLY\nWEB OPTIMAZATION\nno shadows or reflections', '1.80', 'Done', 'Paid', '2020-06-13 20:18:45', 1),
(71, '28', 'JOB NOTEBOOK', '67', '8', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '9', 'SIZE - 1200 X 800 PIXELS PLEASE\nWHITE BACKGROUND\nCROP PROPERLY\nWEB OPTIMAZATION\nNO SHADOWS OR REFLECTIONS', '5.40', 'Done', 'Paid', '2020-06-13 20:52:30', 1),
(72, '3', 'SANY Line Card Poster Images', '67', '', 'PNG', '48 hrs', '11', '', '22', 'Waiting for process', 'Due', '2020-06-15 20:30:12', 1),
(73, '34', '16/06/20 10 images', '67', '', 'Photoshop ( *PSD )', '48 hrs', '10', 'quote requested, see email', '22', 'Done', 'Paid', '2020-06-16 06:31:44', 1),
(74, '29', 'usa shirts', '69', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '50', 'remove background for amazon, trim and drop reflective shadow', '60', 'Done', 'Paid', '2020-06-18 07:16:43', 1),
(75, '29', 'M24 photoshoot', '69', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '60', 'remove background for amazon, trim and drop reflective shadow', '50', 'Done', 'Paid', '2020-06-18 07:37:05', 1),
(76, '29', 'PPE', '69', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '11', 'remove background for amazon, trim and drop reflective shadow', '7.70', 'Done', 'Paid', '2020-06-18 08:08:28', 1),
(77, '28', 'JOB TEELIGHT', '67', '8', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '5', 'SIZE --- 1200 X 800 pixels\nWHITE BACKGROUND\nWEB OPTIMAZATION\nCROP NICELY\nNO SHADOWS OR REFLECTIONS', '3', 'Done', 'Paid', '2020-06-21 19:40:19', 1),
(78, '28', 'JOB COW JUGS', '67', '8', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '9', 'SIZE --- 1200 x 800 pixels\nWHITE BACKROUND\nWEB OPTIMAZATION\nNO SHADOWS OR REFLECTIONS', '5.40', 'Done', 'Paid', '2020-06-21 19:53:40', 1),
(79, '28', 'JOB SC', '67', '8', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '16', 'SIZE --- 1200 X 800 PIXELS\nWHITE BACKGROUND\nWEB OPTIMAZATION\nNO SHADOWS OR REFLECTIONS', '9.60', 'Done', 'Paid', '2020-06-21 21:15:46', 1),
(80, '34', '22/06/20 5 images', '67', '', 'Photoshop ( *PSD )', '48 hrs', '5', 'see email, quote requested', '12', 'Done', 'Paid', '2020-06-22 06:42:31', 1),
(81, '34', '27/06/20 1 image', '67', '', 'Photoshop ( *PSD )', '48 hrs', '1', '', '2', 'Done', 'Paid', '2020-06-27 08:44:35', 1),
(82, '34', '28/06/20 1 image', '67', '', 'Photoshop ( *PSD )', '48 hrs', '1', '', '2', 'Done', 'Paid', '2020-06-27 22:04:57', 1),
(83, '28', 'JOB POPPIES', '67', '8', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '15', 'SIZE -- 1200 X 800 pixels\nWHITE BACKGROUND\nweb optimazation\nno shadows or reflections', '8', 'Done', 'Paid', '2020-06-30 19:46:18', 1),
(84, '28', 'JOB BOWL SETS', '67', '8', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '6', 'SIZE --- 1200 x 800 PIXELS\nWHITE BACKGROUND\nWEB OPTIMZATION\nNO SHADOWS OR REFLECTIONS', '3', 'Done', 'Paid', '2020-06-30 19:55:49', 1),
(85, '7', 'Paketbeilage August', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '34', 'Hello. \n\nWe have some Pictures to process. Is the 1Dollar Flat still available?\nKind Regards. Julian', '34', 'Done', 'Paid', '2020-07-02 04:38:14', 1),
(86, '36', 'Purely Dance 2020', '67', '', 'Photoshop ( *PSD )', '7 days', '39', 'Please return the images as .psd files with three layers.  \nTop layer = Dancers with background removed, \nmiddle layer = solid black,  \nbottom layer = original image', '78', 'Done', 'Paid', '2020-07-02 19:10:35', 1),
(87, '7', 'Paketbeilage Sommer 2', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '40', '', '40', 'Done', 'Paid', '2020-07-08 15:09:18', 1),
(88, '17', 'Disney - July', '69', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '50', 'remove background for amazon, trim, and drop reflective shadow', '50', 'Done', 'Paid', '2020-07-10 17:40:59', 1),
(89, '5', '2020-07-09-KF', '67', '', 'Photoshop ( *PSD )', '48 hrs', '27', 'Please create clipping paths for whole piece, metals and stones and put on separate layers.\n\nThank you.', '62', 'Done', 'Paid', '2020-07-10 18:31:01', 1),
(90, '39', 'Replace dirty/black wheels Dolly 2500', '72', '', 'Photoshop ( *PSD )', '48 hrs', '5', 'Hi there, i would like to fix the wheels on 5 images. They need to be as the reference image wheel (orange kind). See comments/biefing images in the uploaded files (no quote!).\nThe original images are psd files, please return in psd. Thanx in advance\nGr. Paul Heisen\n', '10', 'Processing', 'Due', '2020-07-12 11:03:53', 1),
(91, '34', '13/07/20 six images', '67', '', 'Photoshop ( *PSD )', '48 hrs', '6', 'quote requested - see email', '8', 'Done', 'Paid', '2020-07-13 11:10:01', 1),
(92, '40', 'Dakine Footwear Part 1_0713_2020', '67', '7', 'Photoshop ( *PSD )', '48 hrs', '50', 'clip and shadow. Thank you Asif!', '25', 'Done', 'Paid', '2020-07-13 18:02:30', 1),
(93, '40', 'Dakine Footwear Part 2_071320', '67', '7', 'Photoshop ( *PSD )', '48 hrs', '98', 'clip and shadow. Thank you Asif!\n', '49', 'Done', 'Paid', '2020-07-13 18:22:40', 1),
(95, '5', '2020-07-17-KF', '67', '', 'Photoshop ( *PSD )', '48 hrs', '17', 'Please cut out whole piece, metals and stones and put on separate layers.\n', '39', 'Done', 'Paid', '2020-07-18 18:40:52', 1),
(96, '25', 'Reliance July part 1', '67', '', 'PNG', '5 days', '90', 'please provide price on this order before proceeding', '54', 'Done', 'Paid', '2020-07-22 03:08:50', 1),
(97, '25', 'Reliance July part 2', '67', '', 'PNG', '5 days', '127', '', '76.20', 'Done', 'Paid', '2020-07-22 03:33:12', 1),
(98, '25', 'reliance July part 3', '67', '', 'PNG', '5 days', '30', '', '18', 'Done', 'Paid', '2020-07-22 03:41:28', 1),
(100, '29', '712PH2RS', '69', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '93', 'remove background for amazon, trim and drop reflective shadow. P.S. images: 1P9A8997cr, 1P9A9000cr, 1P9A9012,1P9A9013,1P9A9017 might be already uploaded in a  job 712PH1RS', '93', 'Processing', 'Paid', '2020-07-22 10:52:56', 1),
(101, '29', '712PH1aRS', '69', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '114', 'remove background for amazon, trim and drop reflective shadow', '114', 'Processing', 'Paid', '2020-07-22 11:19:38', 1),
(102, '29', '712PH3RS', '69', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '108', 'remove background for amazon, trim and drop reflective shadow', '108', 'Processing', 'Paid', '2020-07-22 11:29:13', 1),
(103, '29', '712PH4-shirts1', '69', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '72', 'remove background for amazon ( if there are few duplictaes ( same file names- disregard)', '43.40', 'Done', 'Paid', '2020-07-22 11:56:48', 1),
(104, '29', '712PH5', '69', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '14', 'remove background for amazon', '8.40', 'Done', 'Paid', '2020-07-22 12:03:37', 1),
(105, '29', '712PH4-shirts2', '69', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '40', 'remove background for amazon ', '24', 'Done', 'Paid', '2020-07-22 12:22:44', 1),
(106, '34', '24-07-20 three images', '67', '', 'Photoshop ( *PSD )', '48 hrs', '3', 'quote requested, see email', '4', 'Done', 'Paid', '2020-07-24 10:52:22', 1),
(107, '5', '2020-07-24-KF', '67', '', 'Photoshop ( *PSD )', '48 hrs', '36', 'Please cut out whole piece, metals and stones and put on separate layers in PSD files. ', '82', 'Done', 'Paid', '2020-07-25 04:47:09', 1),
(108, '35', 'Facemasks', '67', '7', 'Photoshop ( *TIFF; *TIF )', '48 hrs', '6', 'Hello Asif\nI hope you are keeping well, I am finally back to work. I have a new job for you today with facemasks. Please create a neat clipping path together with Natural / Realistic shadows. Please return the files as Tiffs with the shadows on a separate layer. I will have also a second job later i', '4.20', 'Done', 'Paid', '2020-07-27 09:00:27', 1),
(109, '35', 'Golf Products', '67', '7', 'Photoshop ( *TIFF; *TIF )', '48 hrs', '15', 'Hi Robin\nPlease find a new job for Golf products with 15 images. Please create a very neat clipping path together with Natural / Realistic shadows. Please show the shadows on a Separate layer and return the files as Tiffs.\nMany thanks\nDavid Dempsey', '10.50', 'Done', 'Paid', '2020-07-30 11:27:23', 1),
(110, '5', 'Beladora 2020-07-31', '67', '', 'Photoshop ( *PSD )', '48 hrs', '10', 'Please cutout jewelry, with separate cutouts for stones (diamonds, etc.)', '18', 'Done', 'Paid', '2020-08-01 02:16:07', 1),
(111, '34', '01/08/20 5 images', '67', '', 'Photoshop ( *PSD )', '48 hrs', '5', 'quote requested, see email', '12', 'Done', 'Paid', '2020-08-01 07:31:21', 1),
(112, '43', 'Batch 3', '70', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '44', 'Hi there, \nPlease kindly remove the backgrounds from the attached images, and create ghost mannequin effect on the garments where the inside necklines have been provided. Please return asap\nWith many thanks\nGemma', '19.20', 'Done', 'Paid', '2020-08-03 22:56:42', 1),
(113, '5', '2020-08-03-KF-PT-1', '67', '', 'Photoshop ( *PSD )', '48 hrs', '33', 'Please cut out whole pieces, metals and stones and put on separate layers.\nThank you.', '90', 'Done', 'Paid', '2020-08-04 04:06:16', 1),
(114, '5', '2020-08-03-KF-Pt-2', '67', '', 'Photoshop ( *PSD )', '48 hrs', '31', 'Please cut out whole piece, metals and stones on separate layers.', '78', 'Done', 'Paid', '2020-08-04 04:50:05', 1),
(115, '43', 'Batch 4', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '42', 'Hi there,\nPlease remove the backgrounds from all images and provide ghost mannequin effects to those garments where the neckline or inside of clothing have been provided (not all require ghost mannequin)\n\nLook forward to receiving back asap!\nMany, many thanks\nGemma', '18.30', 'Done', 'Paid', '2020-08-04 23:10:32', 1),
(116, '40', 'The Movement- White', '67', '7', 'Photoshop ( *PSD )', '48 hrs', '9', 'Clip woman on white, careful on the hair. Thank you!', '9', 'Done', 'Paid', '2020-08-05 19:59:04', 1),
(117, '40', 'The Movement-Black', '67', '', 'Photoshop ( *PSD )', '48 hrs', '17', 'Clip woman and place on solid black. Keep layers seperate.', '17', 'Done', 'Paid', '2020-08-05 20:18:59', 1),
(118, '43', 'Batch 5', '70', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '61', 'Hi again, \nPlease could the attached files have back ground removal, and where required ghost mannequin effect (not all garments need this, but should be clear from the images)\n\nThank you for all your hard work so far in returning the files. I greatly appreciate your skill\nKindest regards,\nGemma', '26.50', 'Done', 'Paid', '2020-08-05 22:00:55', 1),
(119, '43', 'Batch 6', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '68', 'Please kindly remove backgrounds from images and create ghost mannequin effect where applicable (necklines provided etc)\n\nRef: Batch 6', '28', 'Done', 'Paid', '2020-08-06 22:18:18', 1),
(120, '43', 'Batch 7', '70', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '23', 'Hello there,\nPlease kindly remove backgrounds and create ghost mannequin effect where required.\n\nMany thanks and much appreciated \nGemma', '9.80', 'Done', 'Paid', '2020-08-07 23:29:14', 1),
(121, '43', 'Batch 8', '70', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '50', 'Please remove backgrounds from all garments and create ghost mannequin effect as required asap please\n\nMany thanks\nGemma', '25', 'Done', 'Paid', '2020-08-09 21:33:00', 1),
(122, '43', 'Batch 9', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '21', 'Please remove backgrounds from all images and create ghost mannequin effects as required. \nIn File 57-9.jpg, please create a neckline for the garments front view, to mirror the high neckline at the back.\nAny questions please let me know.\n(Also have changes to previous files Batches 4', '9.20', 'Done', 'Paid', '2020-08-10 21:48:04', 1),
(123, '43', 'Batch 10', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '19', 'Please remove background from all images and create ghost mannequin where neckline has been added on the coat\nMany thanks \nGemma', '8.30', 'Done', 'Paid', '2020-08-11 21:47:53', 1),
(124, '43', 'Batch 11', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '25', 'Hello\nPlease remove backgrounds from all images. On Images titled STRAP 1, STRAP 2 etc,  remove the hook from the background and clone the strap where the hook was.\n\nMany thanks \nGemma', '12.70', 'Done', 'Paid', '2020-08-12 21:45:17', 1),
(125, '5', '2020-08-11-KF', '67', '', 'Photoshop ( *PSD )', '48 hrs', '36', 'Please cut out whole pieces, metals and stones and place on separate layers. Returns as psd. Thank you.', '128', 'Done', 'Paid', '2020-08-13 03:32:58', 1),
(126, '34', '13-08-20 3 images', '67', '', 'Photoshop ( *PSD )', '48 hrs', '3', '', '7', 'Done', 'Paid', '2020-08-13 13:21:39', 1),
(127, '34', '13-08-20 3 images', '67', '', 'Photoshop ( *PSD )', '48 hrs', '3', '', '7', 'Done', 'Paid', '2020-08-13 13:21:44', 1),
(128, '43', 'Batch 12', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '31', 'Hi again,\nPlease remove backgrounds from all images, and create ghost mannequin for the blue jacket (neckline provided).\nPlease also remove all visible white thread lines on the white stiletto shoes\nMany thanks\nGemma', '15.80', 'Done', 'Paid', '2020-08-13 22:12:08', 1),
(129, '40', 'Hadley', '67', '7', 'Photoshop ( *PSD )', '48 hrs', '5', 'Clipping path and shadow creation. Shadow on a separate layer so I can adjust if necessary. Thank you.', '4', 'Done', 'Paid', '2020-08-19 23:36:19', 1),
(130, '40', 'helix_pt', '67', '7', 'Photoshop ( *PSD )', '48 hrs', '5', 'Clipping path and shadow creation. Shadow on a separate layer so I can adjust if necessary. Thank you.', '4', 'Done', 'Paid', '2020-08-19 23:38:28', 1),
(131, '40', 'helix_st', '67', '7', 'Photoshop ( *PSD )', '48 hrs', '5', 'Clipping path and shadow creation. Shadow on a separate layer so I can adjust if necessary. Thank you.', '4', 'Done', 'Paid', '2020-08-19 23:40:25', 1),
(132, '43', 'Batch 13', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '40', 'Hi there, \nCould I have these images cut out with ghost mannequin effect as required.\nPlease let me know if any delays or problems.\n\nVery many thanks,\nGemma', 'will inform', 'Processing', 'Due', '2020-08-20 15:50:05', 1),
(133, '34', '20-08-20 11 images', '67', '', 'Photoshop ( *PSD )', '5 days', '11', 'quote requested, see email; i need the job completed by next wednesday (august the 26th)', '20', 'Done', 'Paid', '2020-08-20 21:10:38', 1),
(134, '40', 'Fruit Christmas 2020', '67', '', 'Photoshop ( *PSD )', '48 hrs', '32', 'Please remove only the grey background. Thank you!', '33.6', 'Done', 'Paid', '2020-08-24 09:40:36', 1),
(135, '40', 'Fruit Christmas 2020 Table', '67', '', 'Photoshop ( *PSD )', '48 hrs', '3', 'Please remove the grey background. Thank you!', '3', 'Done', 'Paid', '2020-08-24 10:08:05', 1),
(136, '45', 'FCT Product Flat Lays', '68', '7', 'Photoshop ( *PSD )', '48 hrs', '100', '', '60', 'Done', 'Paid', '2020-08-25 17:46:03', 1),
(137, '45', 'FCT Product Flat Lays V2', '68', '7', 'Photoshop ( *PSD )', '48 hrs', '79', '', '47.4', 'Done', 'Paid', '2020-08-25 17:46:58', 1),
(138, '46', 'Andrea Forrest - Colorize Photos', '72', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '72 hrs', '3', 'These photos need to be enhanced and colorized. Please restore as much detail and color as possible. Use your best judgement for colors.  Accurate skin tones appreciated.  The photo of the 2 people sitting on the rocks needs special attention.  The rocks are located in Red Rocks Canyon, so the custo', NULL, NULL, NULL, '2020-08-25 18:13:45', 1),
(139, '46', 'Dave Kimel', '72', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '1', 'Please restore original color to photo as best as possible Thanks!. Keep original size.', NULL, NULL, NULL, '2020-08-26 11:27:52', 1),
(140, '46', 'Bob Surrell', '72', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '1', 'Please restore original detail and clean up as needed.  Try to remove texture from background without compromising the image quality.  Return original size.', NULL, NULL, NULL, '2020-08-26 12:00:52', 1),
(143, '46', 'Choiniere Fred Swan Gallery', '72', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '72 hrs', '2', 'Please bring out detail as best as you can in these pictures.  Restore color, and clean up as needed.', NULL, NULL, NULL, '2020-08-27 10:04:38', 1),
(144, '30', 'AUGUST PHOTOS 2020', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '5 days', '67', 'PLEASE PROVIDE QUOTE PRIOR TO STARTING', '65.50', 'Done', 'Paid', '2020-09-03 04:58:06', 1),
(145, '5', 'Beladora 2020-09-02', '67', '', 'Photoshop ( *PSD )', '48 hrs', '3', 'Please do 1 cutout â€” cutout should be box   jewelry', '10', 'Done', 'Paid', '2020-09-03 06:07:37', 1),
(146, '7', 'Paketbeilage Herbst', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '6', 'Hey. Is the 1$ flat stil available?\nThanks alot!', '6', 'Done', 'Paid', '2020-09-03 07:20:27', 1),
(147, '48', 'Allen Street Floor-plans', '73', '', 'Adobe illustrator (*.AI)', '72 hrs', '5', '', NULL, NULL, NULL, '2020-09-04 18:54:29', 1),
(148, '7', 'Paketbeilage SpÃ¤tsommer 2', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '7', 'Hello\n\nLAst time, i thought i Uploaded much more pictures. so here we go again. \nStill for the 1$ flat if possible, ans as soon as eary :-)\n\nKindest regards. Julian', '7', '', 'Paid', '2020-09-09 05:08:59', 1),
(149, '7', 'Paketbeilage SpÃ¤rsommer 1', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '5', 'Somehow the upload did not work properly, so i will send badge by badge\n1 $ flat .\nLots of love', '5', 'Done', 'Paid', '2020-09-09 12:02:20', 1),
(150, '7', 'Paketbeilage 2', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '10', 'Badge number 2. ', '10', 'Done', 'Paid', '2020-09-09 12:03:03', 1),
(151, '7', 'Paketbeilage 3', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '5', 'Badge number 3', '5', 'Done', 'Paid', '2020-09-09 12:03:43', 1),
(152, '7', 'Paketbeilage 4', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '4', 'Badge number 4 <3<3', '4', 'Done', 'Paid', '2020-09-09 12:04:18', 1),
(153, '7', 'Paketbeilage 5', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '3', 'Badge number 5, thank you so much', '3', 'Done', 'Paid', '2020-09-09 12:04:50', 1),
(154, '7', 'Paketbeilage 6', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '6', 'Badge number 6, xoxo', '6', 'Done', 'Paid', '2020-09-09 12:05:25', 1),
(155, '7', 'Paketbeilage 7', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '5', 'Badge number somewhat 7.\nall the love', '5', 'Done', 'Paid', '2020-09-09 12:06:06', 1),
(156, '7', 'paketbeilage 8', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '4', 'Badge number 8, maybe the last one? xoxo\nyess its the last one!', '4', 'Done', 'Paid', '2020-09-09 12:06:51', 1),
(157, '7', 'Masking Products 1', '68', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '3', 'Hello \nPlease Mask and safe the Productphotos and safe them with a white Background.\nThank you.\nRegards Thomas', '3', 'Done', 'Paid', '2020-09-09 12:54:19', 1),
(158, '21', 'Cut out images and apply on light grey background', '67', '8', 'JPEG ( *JPG; *JPEG; *JPE; *php )', 'undefined', '1', 'As discussed with Asif today and following the tests, please cut-out all images and apply to our light grey background (BACKGROUND.jpg image attached). Please resize all images to be no more than 400KB each. The images have been sent to info@clippingpathhouse.com via WeTransfer.', NULL, NULL, NULL, '2020-09-15 10:43:48', 1),
(160, '5', '2020-09-16-KF', '67', '', 'Photoshop ( *PSD )', '48 hrs', '23', 'Please create clipping paths for whole piece, metals and stones and put on separate layers. Thank you.', '76', 'Done', 'Paid', '2020-09-17 22:07:00', 1),
(161, '45', 'BP_PDP2_DAY1_R1', '68', '7', 'Photoshop ( *PDF )', '72 hrs', '100', 'Hello! We got samples created that I would like to stick to the same style on all of the upcoming files. There will be 1,167 images total. This is the images you created that looked great: www.clippingpathhouse.com/job_download_link/September_2020/1709/2890_Sample_Output.zip', '80', 'Done', 'Paid', '2020-09-18 16:58:17', 1),
(162, '45', 'BP_PDP2_DAY1_R2', '68', '7', 'Photoshop ( *PSD )', '72 hrs', '100', 'Hello! We got samples created that I would like to stick to the same style on all of the upcoming files. There will be 1,167 images total. This is the images you created that looked great: www.clippingpathhouse.com/job_download_link/September_2020/1709/2890_Sample_Output.zip', '80', 'Done', 'Paid', '2020-09-18 18:03:09', 1),
(163, '51', 'Toppers', '68', '', 'Photoshop ( *PSD )', '48 hrs', '5', 'Good clean masks please, pay close attention to the edges. Mask out the background on all of the photos.', NULL, NULL, NULL, '2020-09-18 20:12:50', 1),
(164, '51', 'Toppers bowls and spices', '68', '', 'Photoshop ( *PSD )', '48 hrs', '36', 'Good, clean, accurate masks. mask out the backgrounds, no shadows.', '18.00', 'Done', 'Paid', '2020-09-18 21:00:50', 1),
(165, '51', 'Toppers bowls and spices', '68', '', 'Photoshop ( *PSD )', '48 hrs', '36', 'Good, clean, accurate masks. mask out the backgrounds, no shadows.', '18.00', 'Done', 'Paid', '2020-09-18 21:01:51', 1),
(166, '51', 'Toppers bowls and spices', '68', '', 'Photoshop ( *PSD )', '48 hrs', '36', 'Good, clean, accurate masks. mask out the backgrounds, no shadows.', '18.00', 'Done', 'Paid', '2020-09-18 21:02:52', 1),
(167, '51', 'Toppers bowls and spices', '68', '', 'Photoshop ( *PSD )', '48 hrs', '36', 'Good, clean, accurate masks. mask out the backgrounds, no shadows.', '18.00', 'Done', 'Paid', '2020-09-18 21:03:52', 1),
(168, '51', 'Toppers bowls and spices', '68', '', 'Photoshop ( *PSD )', '48 hrs', '36', 'Good, clean, accurate masks. mask out the backgrounds, no shadows.', '18.00', 'Done', 'Paid', '2020-09-18 21:04:52', 1),
(169, '45', 'BP_PDP2_DAY1_R3', '68', '7', 'Photoshop ( *PSD )', '72 hrs', '100', 'Hello! We got samples created that I would like to stick to the same style on all of the upcoming files. There will be 1,167 images total. This is the images you created that looked great: www.clippingpathhouse.com/job_download_link/September_2020/1709/2890_Sample_Output.zip', '80', 'Done', 'Paid', '2020-09-18 22:49:41', 1),
(170, '45', 'BP_PDP2_DAY1_R4', '68', '7', 'Photoshop ( *PSD )', '48 hrs', '100', 'Hello! We got samples created that I would like to stick to the same style on all of the upcoming files. There will be 1,167 images total. This is the images you created that looked great: www.clippingpathhouse.com/job_download_link/September_2020/1709/2890_Sample_Output.zip', '80', 'Done', 'Paid', '2020-09-21 16:09:47', 1),
(171, '45', 'BP_PDP2_DAY1_R5', '68', '7', 'Photoshop ( *PSD )', '48 hrs', '1', 'Hello! We got samples created that I would like to stick to the same style on all of the upcoming files. There will be 1,167 images total. This is the images you created that looked great: www.clippingpathhouse.com/job_download_link/September_2020/1709/2890_Sample_Output.zip', '0.80', 'Done', 'Paid', '2020-09-21 16:12:44', 1),
(172, '45', 'BP_PDP2_DAY1_R5_2', '68', '7', 'Photoshop ( *PSD )', '48 hrs', '26', 'Hello! We got samples created that I would like to stick to the same style on all of the upcoming files. There will be 1,167 images total. This is the images you created that looked great: www.clippingpathhouse.com/job_download_link/September_2020/1709/2890_Sample_Output.zip', '20.80', 'Done', 'Paid', '2020-09-21 16:19:28', 1),
(173, '45', 'BP_PDP2_DAY2_R1', '67', '7', 'Photoshop ( *PSD )', '48 hrs', '100', 'Hello! We got samples created that I would like to stick to the same style on all of the upcoming files. There will be 1,167 images total. This is the images you created that looked great: www.clippingpathhouse.com/job_download_link/September_2020/1709/2890_Sample_Output.zip', '80', 'Done', 'Paid', '2020-09-21 16:34:01', 1),
(174, '45', 'BP_PDP2_DAY2_R3', '68', '7', 'Photoshop ( *PSD )', '48 hrs', '100', 'Hello! We got samples created that I would like to stick to the same style on all of the upcoming files. There will be 1,167 images total. This is the images you created that looked great: www.clippingpathhouse.com/job_download_link/September_2020/1709/2890_Sample_Output.zip', '80', 'Done', 'Paid', '2020-09-21 16:57:46', 1),
(175, '45', 'BP_PDP2_DAY2_R2', '68', '7', 'Photoshop ( *PSD )', '48 hrs', '100', 'Hello! We got samples created that I would like to stick to the same style on all of the upcoming files. There will be 1,167 images total. This is the images you created that looked great: www.clippingpathhouse.com/job_download_link/September_2020/1709/2890_Sample_Output.zip', '80', 'Done', 'Paid', '2020-09-21 17:17:51', 1),
(176, '45', 'BP_PDP2_DAY2_R4', '68', '7', 'Photoshop ( *PSD )', '48 hrs', '93', 'Hello! We got samples created that I would like to stick to the same style on all of the upcoming files. There will be 1,167 images total. This is the images you created that looked great: www.clippingpathhouse.com/job_download_link/September_2020/1709/2890_Sample_Output.zip\n', '74.40', 'Done', 'Paid', '2020-09-21 17:40:05', 1),
(177, '45', 'BP_PDP2_DAY3_R1', '68', '7', 'Photoshop ( *PSD )', '48 hrs', '100', 'Hello! We got samples created that I would like to stick to the same style on all of the upcoming files. There will be 1,167 images total. This is the images you created that looked great: www.clippingpathhouse.com/job_download_link/September_2020/1709/2890_Sample_Output.zip', '80', 'Done', 'Paid', '2020-09-21 18:33:03', 1),
(178, '45', 'BP_PDP2_DAY3_R2', '68', '7', 'Photoshop ( *PSD )', '48 hrs', '100', 'Hello! We got samples created that I would like to stick to the same style on all of the upcoming files. There will be 1,167 images total. This is the images you created that looked great: www.clippingpathhouse.com/job_download_link/September_2020/1709/2890_Sample_Output.zip', '80', 'Done', 'Paid', '2020-09-21 19:05:31', 1),
(179, '45', 'BP_PDP2_DAY3_R3', '68', '7', 'Photoshop ( *PSD )', '48 hrs', '100', 'Hello! We got samples created that I would like to stick to the same style on all of the upcoming files. There will be 1,167 images total. This is the images you created that looked great: www.clippingpathhouse.com/job_download_link/September_2020/1709/2890_Sample_Output.zip', '80', 'Done', 'Paid', '2020-09-21 19:20:39', 1),
(180, '45', 'BP_PDP2_DAY3_R4', '68', '7', 'Photoshop ( *PSD )', '48 hrs', '45', 'Hello! We got samples created that I would like to stick to the same style on all of the upcoming files. There will be 1,167 images total. This is the images you created that looked great: www.clippingpathhouse.com/job_download_link/September_2020/1709/2890_Sample_Output.zip', '36', '', 'Paid', '2020-09-21 21:27:55', 1),
(181, '7', 'Paketbeilage Winter 01', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '13', 'Hello there, ist the Flat still available?\nWe have some pictures to proceed. \nKind regards, ', '13', 'Waiting for process', 'Paid', '2020-09-23 11:51:29', 1),
(182, '7', 'Packetbeilage Winter 02', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '14', 'Anothter one for the flat. \nthank you', '14', 'Waiting for process', 'Paid', '2020-09-23 11:52:24', 1),
(183, '7', 'Packetbeilage Winter 03', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '3', 'Here we go, Mambo Number 3 for the flat\nkindest', '3', 'Waiting for process', 'Paid', '2020-09-23 11:53:12', 1),
(184, '7', 'Packetbeilage 04', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '10', 'Number foooooor. \nFlat it is? <3', '10', 'Waiting for process', 'Paid', '2020-09-23 11:53:48', 1),
(185, '7', 'Packetbeilage Winter 5', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '11', 'And the last one for the flat. \nKindest regards!\nxoxo\nJulian', '11', 'Waiting for process', 'Paid', '2020-09-23 11:55:07', 1),
(186, '5', '2020-09-23-KF-PT-1', '67', '', 'Photoshop ( *PSD )', '48 hrs', '17', 'Please cut out whole piece, metal and stones and place on separate layers.', '64.60', 'Done', 'Paid', '2020-09-24 05:19:38', 1),
(187, '5', '2020-09-23-KF-PT-2', '67', '', 'Photoshop ( *PSD )', '48 hrs', '23', 'Please cut out whole piece, metals and stones and place on separate layers.', '87.40', 'Done', 'Paid', '2020-09-24 05:37:58', 1),
(188, '11', 'WP210920', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '87', 'Hi, As communicated earlier.  Please could you give all of the gun images a bright white background with no shadows around the guns.  I need the files back as High res files at a minimum size of 2mb please.  Please could I have them back by Monday which is when the client is expecting them.  I will ', '25', 'Done', 'Paid', '2020-09-25 17:02:19', 1),
(189, '11', 'WP220920 Batch 1 of 2', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '96', 'Hi\nI tried using the FTP option and have sent an email showing an error with your server.  This is Batch 1 of 2 with with 96 files.  Please can you return all of the files with pure white backfgrounds and no shadows.  I need the files returned as High Res as a minimum of 2mb per file please as soon ', '', 'Done', 'Paid', '2020-09-26 20:42:11', 1),
(190, '11', 'WP 220920 Batch 2 of 2', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '27', 'Please can you return all of the files with pure white backfgrounds and no shadows.  I need the files returned as High Res as a minimum of 2mb per file please as soon as possible,\nMany thanks. (THis is Batch 2 of 2, 27 files)', '', 'Done', 'Paid', '2020-09-26 21:37:02', 1),
(191, '54', 'Second and Charles Job 1 Week 32 images ', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '1', 'can you provide me a quote on this job. thank you.', '00', '', 'Free', '2020-09-29 14:46:21', 1),
(192, '55', 'derby retro', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', 'undefined', '6', 'Clipping path around main player and ball please. $0.50 per image. ', '3', 'Done', 'Paid', '2020-09-29 19:41:23', 1),
(193, '55', 'Ipswich A3', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', 'undefined', '12', 'Clipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', '6', 'Done', 'Paid', '2020-09-30 12:59:28', 1),
(194, '54', 'Second and Charles Job 1 Week ', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '1', '', '00', '', 'Free', '2020-09-30 18:05:03', 1),
(195, '57', 'Path Clipping 2020/10/01', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '5 days', '3', 'Hi! I need a Path Clipping for the attached 3 pictures. Please clip everything that is part of the drumset (drums, hardware, cymbals etc.) and don\'t remove anything from the original picture.\n\nLast time we paid 2$ for each picture. I suppose it\'ll be the same price this time?', '6', 'Done', 'Paid', '2020-10-01 09:55:53', 1),
(197, '55', 'Norwich City X 11', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', 'undefined', '11', 'Clipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', '5.50', 'Done', 'Paid', '2020-10-02 16:14:55', 1),
(198, '55', 'DERBY X 6', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', 'undefined', '6', 'Clipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', '3', 'Done', 'Paid', '2020-10-02 16:18:14', 1),
(199, '61', 'PURSES', '67', '', 'Photoshop ( *PSD )', '48 hrs', '4', '', '2.80', 'Done', 'Paid', '2020-10-03 16:47:33', 1),
(200, '5', '2020-10-02-KF', '67', '', 'Photoshop ( *PSD )', '48 hrs', '25', 'Please cut out whole piece from background, metals and stones and place on separate layers.', '86', 'Done', 'Paid', '2020-10-03 18:53:12', 1),
(201, '55', 'Middlesbrough calendar', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', 'undefined', '22', 'Clipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', '11', 'Done', 'Paid', '2020-10-05 15:16:08', 1),
(202, '55', 'BRIGHTON ANNUAL COVER', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', 'undefined', '8', 'Clipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', '4', 'Done', 'Paid', '2020-10-06 12:58:52', 1),
(203, '55', 'NORWICH ANNUAL COVER', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', 'undefined', '1', 'Clipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', '0.50', 'Done', 'Paid', '2020-10-06 12:59:33', 1),
(204, '55', 'LEICESTER ANNUAL COVER', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', 'undefined', '7', 'Clipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', '3.50', 'Done', 'Paid', '2020-10-06 13:00:56', 1),
(205, '55', 'BURNLEY A3', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', 'undefined', '18', 'Clipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', '9', 'Done', 'Paid', '2020-10-06 14:45:15', 1),
(206, '25', 'Mordens', '67', '', 'PNG', '5 days', '46', 'please clip out packages. Please note the one set of products set on a black pedestal, please cut off.', '27.60', 'Done', 'Paid', '2020-10-06 20:01:34', 1),
(207, '55', 'derby x 2', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', 'undefined', '2', 'Clipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', '1', 'Done', 'Paid', '2020-10-07 10:47:40', 1),
(208, '55', 'DYCHE', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', 'undefined', '1', 'Clipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', '0.50', 'Done', 'Paid', '2020-10-07 11:04:43', 1),
(209, '55', 'DERBY - CLARKE', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', 'undefined', '1', 'Clipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', '0.50', 'Done', 'Paid', '2020-10-07 11:12:22', 1),
(210, '55', 'WATFORD ANNUAL COVER', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', 'undefined', '8', 'Clipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', '4', 'Done', 'Paid', '2020-10-07 11:25:57', 1),
(211, '55', 'WATFORD ANNUAL COVER', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', 'undefined', '8', 'Clipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', '4', 'Done', 'Paid', '2020-10-07 11:26:00', 1),
(212, '62', 'BRCKS Chapter 15 - Part 1', '67', '', 'Photoshop ( *PSD )', '15 hrs - Price will be double - not available', '39', 'Gloves for Clipping Part 1 - Att: Ahad - Please refer to email and previous job for brcks@fisthandwear.com', '15.60', 'Done', 'Paid', '2020-10-07 11:40:15', 1),
(213, '62', 'Part 2', '67', '', 'Photoshop ( *PSD )', '15 hrs - Price will be double - not available', '12', 'Part 2 (12 files)', '4.80', 'Done', 'Paid', '2020-10-07 11:44:23', 1),
(214, '55', 'SWANSEA ANNUAL COVER', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', 'undefined', '9', 'Clipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', '4.5', 'Done', 'Paid', '2020-10-07 11:46:21', 1),
(215, '55', 'BRIGHTON A3', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', 'undefined', '29', 'Clipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', '14.5', 'Done', 'Paid', '2020-10-07 13:06:48', 1),
(216, '35', 'Scarves ( 5 images)', '67', '7', 'Photoshop ( *TIFF; *TIF )', '48 hrs', '5', 'Urgent --- Many thanks\nPlease create a very neat clipping path / image masking  together with natural realistic shadows on  separate layer. Can you possibly have the files in 12 hours? Please return the files as Tiffs --many thanks for you help - David', '4', 'Done', 'Paid', '2020-10-07 13:35:10', 1),
(217, '7', 'Christmas Paketbeilage', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '17', 'Hello you wonderfull guys!\nI have some other pictures to process. \nIst the flat still available?\n\nKindest regards. \nJulian', '17', 'Done', 'Paid', '2020-10-08 08:54:10', 1),
(218, '35', 'Bags - October 2020', '67', '7', 'Photoshop ( *TIFF; *TIF )', '48 hrs', '11', 'Hello Arif\nI have a new job today with 11 files. Please create a very, very neat clipping path on all files together with natural shadows. Please show the shadows on a separate layer and return the files as Tiffs. It would be great if you could have the files in 24 hours if possible.\nMany thanks - D', '8.80', 'Done', 'Paid', '2020-10-09 10:13:57', 1),
(219, '34', '09-10-2020 11 images', '67', '', 'Photoshop ( *PSD )', '48 hrs', '11', 'Quote requested, see email', '26', 'Done', 'Paid', '2020-10-09 13:52:26', 1),
(220, '55', 'Leicester x 2', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', 'undefined', '2', 'Clipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', '1', 'Done', 'Paid', '2020-10-09 16:12:39', 1),
(221, '55', 'FOREST COVER', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', 'undefined', '8', 'Clipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', '4', 'Done', 'Paid', '2020-10-09 16:28:05', 1),
(222, '64', '1st test 10-10-2020', '67', '7', 'Photoshop ( *PSD )', 'undefined', '100', 'we need it urgent it\'s really urgent ! ', '50', 'Waiting for process', 'Due', '2020-10-09 18:15:39', 1),
(223, '64', '2 nd job test 1.5 GB', '69', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '72 hrs', '40', 'Hello,\nWeâ€™ve got your new images editing work order. Thanks for that.\nWe will be back on time after processing as per your instructions.\nIf you have any query, Please feel free to knock us any time.\nHave a nice time. \n', '00', 'Done', 'Free', '2020-10-10 08:07:16', 1),
(224, '64', '1', '67', '', 'Photoshop ( *PSD )', '7 hrs - Price will be triple', '1', 'it\'s', '00', 'Done', 'Free', '2020-10-10 16:24:12', 1),
(225, '64', '2', '68', '', 'undefined', '15 hrs - Price will be double', '1', '', '00', 'Done', 'Free', '2020-10-10 16:28:07', 1),
(226, '64', '3', '69', '7', 'Photoshop ( *TIFF; *TIF )', '30 hrs', '1', '', '00', 'Done', 'Free', '2020-10-10 16:31:28', 1),
(227, '64', '4', '70', '10', 'Photoshop (*EPS )', '48 hrs', '1', '', '00', 'Done', 'Free', '2020-10-10 16:37:12', 1),
(229, '55', 'sunderland cover', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', 'undefined', '8', 'Clipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', '4', 'Done', 'Paid', '2020-10-12 14:34:15', 1),
(230, '55', 'LEEDS COVER', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', 'undefined', '5', 'Clipping path around main player and ball. Please be as accurate as possible.\n$0.50 per image', '2.50', 'Done', 'Paid', '2020-10-12 20:15:32', 1),
(231, '55', 'leeds cover 2', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', 'undefined', '4', 'Clipping path around main player and ball. Please be as accurate as possible. $0.50 per image', '2', 'Done', 'Paid', '2020-10-12 20:20:09', 1),
(232, '45', 'BP_PDP2_REVISIONS', '68', '10', 'Photoshop ( *PSD )', '48 hrs', '5', 'Hello there! We discovered that there were some missing files that we didn\'t send over with the previous batch. I was wondering if I could get the attached images clipped, color corrected, and then shadow added to only the two that need it (0513 ', '4', 'Done', 'Free', '2020-10-13 02:09:50', 1),
(233, '7', '201013_GAX_Products', '67', '', 'Photoshop ( *TIFF; *TIF )', '15 hrs - Price will be double', '17', 'We have 17 pictures to process. Is the 1$ flatrate available as usual? Thank you for our excellent job.', '34', 'Done', 'Paid', '2020-10-13 09:40:34', 1),
(234, '55', 'ameobi', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', 'undefined', '1', 'Clipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', '0.50', 'Done', 'Paid', '2020-10-13 15:58:05', 1),
(235, '5', '2020-10-14-Italian-Gold', '67', '', 'Photoshop ( *PSD )', '30 hrs', '1', 'Please cut our whole piece, and different metals. Put on separate layers, PSD.\nThank you.', '2', 'Done', 'Paid', '2020-10-15 04:52:10', 1);
INSERT INTO `tbl_register_job` (`id`, `fld_user_id`, `fld_job_title`, `fld_main_service`, `fld_add_service`, `fld_format`, `fld_delivery_time`, `fld_total_files`, `fld_job_instruction`, `fld_amount`, `fld_payment_type`, `fld_payment_status`, `fld_datetime`, `fld_read`) VALUES
(236, '35', 'Cases / belt (October 2020)', '67', '7', 'Photoshop ( *TIFF; *TIF )', '30 hrs', '7', 'Hi Arif\nPlease create a very neat clipping path on all files together with Natural / realistic shadows. Please show the shadows on a separate layer and return the files as Tiffs. Can you include the wood / tree in number 18 (see example attached).\nMany thanks - David Dempsey', '4.8', 'Done', 'Paid', '2020-10-15 10:19:50', 1),
(237, '5', '2020-10-14-KF-Product', '67', '', 'Photoshop ( *PSD )', '30 hrs', '19', 'Please cut out whole piece, metals and stones and put on separate layers.\nThank you.', '28', 'Done', 'Paid', '2020-10-15 15:21:03', 1),
(238, '17', 'Halloween  part 1', '75', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '56', 'please remove background for amazon and trim', '56', 'Done', 'Paid', '2020-10-15 23:05:16', 1),
(239, '17', 'Halloween part 2', '75', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '48', 'remove background for amazon and trim', '48', 'Done', 'Paid', '2020-10-15 23:20:37', 1),
(240, '55', 'WATFORD DESK', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', 'undefined', '5', 'Clipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', '2.50', 'Done', 'Paid', '2020-10-16 15:41:22', 1),
(241, '17', 'halloween part 3', '75', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '1', 'remove background, trim and make sure sRGB profile selected', '12', 'Done', 'Paid', '2020-10-20 02:49:23', 1),
(242, '55', 'TROOST', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', 'undefined', '1', 'Clipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', '00.50', 'Done', 'Paid', '2020-10-20 14:09:01', 1),
(243, '35', 'Candles - October 2025', '67', '7', 'Photoshop ( *TIFF; *TIF )', '30 hrs', '18', 'Hi Arif - I am sending you a new job today with 18 files. Please create a very neat clipping path on all files together with Natural / Realistic shadows on Separate layers. Please return the files as Tiffs. Please include / leave in the plastic gift wrapping on the files. Many thanks for all your he', '14.40', 'Done', 'Paid', '2020-10-20 14:10:52', 1),
(244, '11', 'WP191020', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '66', 'Hi\nAs usual, please could you send the files back with pure white backgrounds and no shadows around the outlines of the guns. I also need the files to be returned with a size of 2mb or more where possible please.  There are 66 files. \n Many thanks', '23.80', 'Done', 'Paid', '2020-10-20 22:57:55', 1),
(245, '25', 'Reliance Oct', '67', '', 'PNG', '5 days', '38', '', '22.80', 'Done', 'Paid', '2020-10-22 20:53:55', 1),
(246, '5', '2020-10-22-KF', '67', '', 'Photoshop ( *PSD )', '30 hrs', '16', 'Please cut out whole piece, stones and metals and place on separate layers. Return as PSD, 30 hrs please. Thank you.', '38', 'Done', 'Paid', '2020-10-23 01:08:35', 1),
(247, '35', 'Candle sets - October 2020', '67', '7', 'Photoshop ( *TIFF; *TIF )', '30 hrs', '9', 'Hello Arif - I have a new job for you today which is similar to the job that I sent you last week. Can you please create a very neat clipping path together with Natural / Realistic shadows on separate layers. Please return the files as Tiffs. Please also include / leave in the plastic wrapping on th', '7.2', 'Done', 'Paid', '2020-10-28 12:26:59', 1),
(248, '17', 'Mickey', '75', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '51', 'remove background, trim, change profile to sRGB', '51', 'Done', 'Due', '2020-10-29 03:39:36', 1),
(249, '17', 'Mickey', '75', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '51', 'remove background, trim, change picture profile to sRGB', '00', '', 'Free', '2020-10-29 03:49:37', 1),
(250, '25', 'CDS', '67', '', 'PNG', '5 days', '138', '', '82', 'Done', 'Paid', '2020-10-29 13:21:57', 1),
(251, '51', 'SF Bay', '68', '', 'Photoshop ( *PSD )', '30 hrs', '30', 'Good, clean masks around products. Pay close attention to the edges.', '15', 'Done', 'Paid', '2020-10-29 17:10:43', 1),
(252, '11', 'WP291020', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '1', 'Hi\nI sent this request last week and it was missed.  I have one file that was missed in a previous order.  Please could you send back with no shadows and a pure white background.  I need it to be sent back as 2mb minimu if possible.  A quick turnaround would be much appreciated as this was missed by', '0.30', 'Done', 'Due', '2020-10-29 17:41:59', 1),
(253, '55', 'BURNLEY', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', 'undefined', '6', 'Clipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', '3', 'Done', 'Paid', '2020-10-30 17:04:12', 1),
(254, '65', 'Mottola Grocery 1', '67', '8', 'PNG', '30 hrs', '96', 'Wanting to take our products and put them on a Shopify site \n\nNot sure what to ask for as I have never done this before. But Id like them to not have background and look the best they can', '57.6', 'Done', 'Paid', '2020-11-03 04:26:56', 1),
(255, '23', '11-03-20-DRP', '67', '', 'Photoshop ( *PSD )', '30 hrs', '81', 'Please cut out whole piece and put on separate layers. ', '64.80', 'Done', 'Paid', '2020-11-03 07:19:53', 1),
(256, '23', '11-04-20-DRP', '67', '', 'Photoshop ( *PSD )', '30 hrs', '54', 'Please cut out whole piece and place on separate layers.', '43.20', 'Done', 'Paid', '2020-11-04 07:27:52', 1),
(257, '7', 'Masking Products Part 1/2', '67', '', 'Photoshop ( *TIFF; *TIF )', '30 hrs', '10', 'Hello \nPlease remove all the Background and safe the the Products with a transparent background.\nThank you ', '20', 'Done', 'Paid', '2020-11-06 07:00:55', 1),
(258, '7', 'Masking Products Part 2/3', '67', '', 'Photoshop ( *TIFF; *TIF )', '30 hrs', '12', 'Hello \nPlease remove all the Background and safe the the Products with a transparent background.\nThank you ', '24', 'Done', 'Paid', '2020-11-06 07:13:32', 1),
(259, '7', 'Masking Products Part 3/3', '67', '', 'Photoshop ( *TIFF; *TIF )', '30 hrs', '9', 'Hello \nPlease remove all the Background and safe the the Products with a transparent background.\nThank you ', '18', 'Done', 'Paid', '2020-11-06 07:19:54', 1),
(260, '5', '2020-11-05-Italian-Gold-Banner-18', '67', '', 'Photoshop ( *PSD )', '30 hrs', '1', 'Please cut out whole piece, stones and metals and place on a  separate layer.', '00', '', 'Free', '2020-11-06 16:12:16', 1),
(261, '5', '11-08-20-KF', '67', '', 'Photoshop ( *PSD )', '30 hrs', '1', 'Please cut out whole piece, stones and metals and place on separate layers.\n', NULL, NULL, NULL, '2020-11-08 18:35:29', 1),
(262, '23', 'DRP-11-09-20', '67', '', 'Photoshop ( *PSD )', '30 hrs', '17', 'Please cut out whole piece and place on separate layers.', '13.60', 'Done', 'Paid', '2020-11-10 06:49:44', 1),
(263, '55', 'Motherwell', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', 'undefined', '24', 'Clipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', '12', 'Done', 'Paid', '2020-11-10 11:56:03', 1),
(265, '68', 'Adaptive VGA Web Site', '67', '', 'PNG', '15 hrs - Price will be double', '1', 'Add clipping path to image supplied x 1', '00', '', 'Free', '2020-11-11 00:59:15', 1),
(266, '68', 'Adaptive Canopy Brochure', '67', '10', 'PNG', '15 hrs - Price will be double', '1', 'Hi Asif,\nQuote Request first please. We have not had a reply from the Get Quote Portal\nRetouch supply image IMG_3124\n1: Add Clipping Path\n2: Delete Front Bumper Bar\n3: Clean out Canopy and Vehicle Windows and windscreen to white with tone, as if shot on a white background, not deep etched\n4: Colour ', '00', '', 'Free', '2020-11-11 02:48:19', 1),
(267, '40', 'Dewalt Winter 2020', '67', '7', 'Photoshop ( *PSD )', '30 hrs', '70', 'Please clip images and put onto white background. Also create adjustable image shadow on separate layer. Thank you!', '42', 'Done', 'Paid', '2020-11-11 06:53:07', 1),
(268, '68', 'Adaptive Canopy Brochure_ IMG3124 Colour Correction', '69', '', 'PNG', '30 hrs', '1', 'Hi Ahad / Asif,\n\nColour Correction to image IMG_3124 supplier\n1: Adjust white vehicle to match Grey of Ute Tub and Canopy\nWhole Vehicle to be Grey, please\n\nThank You\n', '00', '', 'Free', '2020-11-11 21:03:58', 1),
(269, '40', 'Dakine Slush Slipper', '67', '7', 'Photoshop ( *PSD )', '30 hrs', '30', 'Clip onto white and create shadow. Thank you!', '18', 'Done', 'Paid', '2020-11-12 04:55:05', 1),
(270, '40', 'Dakine Snow Boot', '67', '7', 'Photoshop ( *PSD )', '30 hrs', '35', 'Clip onto white and create shadow. Thank you!', '21', 'Done', 'Paid', '2020-11-12 06:02:48', 1),
(271, '7', 'Digitec Galaxus AG', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '15 hrs - Price will be double', '8', '', '16', 'Done', 'Paid', '2020-11-12 08:39:34', 1),
(272, '7', 'Digitec Galaxus AG', '67', '', 'PNG', '30 hrs', '8', '', '16', 'Done', 'Paid', '2020-11-12 08:59:17', 1),
(273, '7', 'Digitec Galaxus AG', '67', '', 'PNG', '30 hrs', '8', '', '16', 'Done', 'Paid', '2020-11-12 09:04:43', 1),
(274, '7', 'Digitec Galaxus AG', '67', '', 'PNG', '30 hrs', '8', '', '16', 'Done', 'Paid', '2020-11-12 09:09:50', 1),
(275, '7', 'Digitec Galaxus AG', '67', '', 'PNG', '30 hrs', '9', '', '18', 'Done', 'Paid', '2020-11-12 09:13:21', 1),
(276, '7', 'Digitec Galaxus AG', '67', '', 'PNG', '30 hrs', '10', '', '20', 'Done', 'Paid', '2020-11-12 09:14:30', 1),
(277, '7', 'Digitec Galaxus AG', '67', '', 'PNG', '30 hrs', '10', '', '20', 'Done', 'Paid', '2020-11-12 09:16:03', 1),
(278, '35', 'Cleaning products (November 2020)', '67', '7', 'Photoshop ( *TIFF; *TIF )', '30 hrs', '6', 'Hi Arif. I have a new job today for cleaning products. if its possible could you have the files in 18 - 24 hours (thanks). Please create a very neat clipping path together with natural / realistic shadows on the 6 files. Can you please show the shadows on a separate layer and return the files as Tif', '4.80', '', 'Paid', '2020-11-12 11:05:01', 1),
(279, '7', 'Digitec Galaxus AG', '67', '', 'PNG', '30 hrs', '11', '', '11', 'Done', 'Paid', '2020-11-12 14:08:49', 1),
(280, '40', 'Dewalt Clothing Winter 2020', '67', '7', 'Photoshop ( *PSD )', '30 hrs', '12', 'Clip onto white and create shadow. Thank you so much!', '8.40', 'Waiting for Payment', 'Paid', '2020-11-13 01:25:43', 1),
(282, '23', 'DRP-11-17-20', '67', '', 'Photoshop ( *PSD )', '30 hrs', '64', 'Please cut out whole piece and place on separate layer.', '51.20', 'Done', 'Paid', '2020-11-17 08:27:41', 1),
(283, '71', 'match colors', '69', '10', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '15 hrs - Price will be double', '18', 'Jpgs are painting reproductions. They must have the same color that the pngs. Please I need budget for the job. URGENT', NULL, NULL, NULL, '2020-11-19 13:22:17', 1),
(284, '35', '2 images - November 2020', '67', '7', 'Photoshop ( *TIFF; *TIF )', '30 hrs', '2', 'Hello Arif\nI hope you are keeping well, I have a small job today with 2 files. Please create a very neat clipping path together with Natural shadows on a separate layer. Can you make the shadows a bit bigger that normal (at the bottom). Please return the files as Tiffs - Many thanks - David Dempsey', '1.6', 'Done', 'Paid', '2020-11-19 15:11:44', 1),
(285, '11', 'WP181120', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '81', 'Hi\nPlease could I have all of the images back with pure white backgrounds and no shadows under the gun.  The files need to be returned as 2mb where possible.  97 files in total.', '28.7', 'Done', 'Paid', '2020-11-21 18:10:30', 1),
(286, '35', 'Tea Towels', '67', '7', 'Photoshop ( *TIFF; *TIF )', '30 hrs', '10', 'Hi Arif\nI am sending you a new job today with 10 Files. Please create a very neat clipping path together with Natural / Realistic shadows. Please show the shadows on a separate layer and return the files as Tiffs. If possible can you have the job ready in 18 hours. Many thanks - David Dempsey', '8', 'Done', 'Paid', '2020-11-27 11:10:41', 1),
(287, '17', 'mrMrsGrinch', '75', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '2', 'remove background and trim. Please do asap, only 2 photos', '2', 'Done', 'Due', '2020-11-28 04:10:07', 1),
(288, '72', 'image editing', '67', '10', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '5 days', '1', 'image 1: Please remove watermarks, change background to white. Split the two sunglasses into two photos. So I need three photos 1. Two sunglasses in one photo as supplied. 2. Two sunglasses in separate pic', '2.5', 'Done', 'Paid', '2020-11-29 00:15:09', 1),
(289, '72', 'image editing', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '5 days', '1', 'Create a new pic using the first 4 rows. Remove all writings. At the bottom in red letters write POLARISED. Background to be white. enlarge/ optimise size of the sunglasses to optimise. ', '2.5', 'Done', 'Paid', '2020-11-29 00:24:16', 1),
(290, '40', 'Dewalt_112920', '67', '7', 'Photoshop ( *PSD )', '15 hrs - Price will be double', '15', '', '18', 'Done', 'Paid', '2020-11-30 01:12:28', 1),
(291, '7', 'Mammut Skijacket', '75', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '11', 'Hello\nWe have 11 pictures to process. Is the 1 USD flat rate still aviable?\nThanks', '11', 'Done', 'Paid', '2020-11-30 15:27:17', 1),
(292, '23', '11-30-20-DRP', '67', '', 'Photoshop ( *PSD )', '30 hrs', '38', 'Please cut out whole piece of apparel from background. ***Please cut out the graphics and letters on the Tee shirts only  and put on separate layers.', '30.4', 'Done', 'Paid', '2020-12-01 05:43:38', 1),
(293, '73', 'GLS 1', '67', '', 'PNG', '30 hrs', '25', 'clip and delete background ', '15', 'Done', 'Paid', '2020-12-01 12:55:18', 1),
(294, '73', 'GLS 2', '67', '', 'PNG', '30 hrs', '29', 'please delete background and also delete all cables!! no black cable should be visible on the imagaes in this upload', '17.40', '', 'Paid', '2020-12-01 13:06:35', 1),
(295, '5', '11-30-20-KF', '67', '', 'Photoshop ( *PSD )', '30 hrs', '25', 'Please cut out whole pieces, metals and stones and place on separate layers. Thank you.', '80', 'Done', 'Paid', '2020-12-01 15:25:29', 1),
(296, '30', 'Nov 2020 etches', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '5 days', '27', 'Please quote prior commence job', '00', '', 'Free', '2020-12-03 05:35:03', 1),
(297, '30', 'Nov 2020 etches', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '5 days', '27', 'Please quote prior commence job', '00', '', 'Free', '2020-12-03 05:35:31', 1),
(298, '30', 'Nov 2020 etches', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '5 days', '27', 'Please quote prior commence job', '22.10', 'Done', 'Paid', '2020-12-03 05:40:53', 1),
(299, '73', 'GLS 3', '67', '', 'PNG', '30 hrs', '6', '', '3.6', 'Done', 'Paid', '2020-12-03 07:27:01', 1),
(300, '35', 'Bottles - December 2020', '67', '7', 'Photoshop ( *TIFF; *TIF )', '30 hrs', '5', 'Hell Arif. I have a new job today with 5  files. Please create a very neat clipping path together with Natural / Realistic shadows. Please create the shadows on a separate layer and return the files as Tiffs. Can you have the files if possible in 18 hours. Many thanks - David Dempsey', '4', 'Done', 'Paid', '2020-12-03 15:04:12', 1),
(301, '34', '06/12/20 23 images', '67', '', 'Photoshop ( *PSD )', '72 hrs', '23', 'quote requested, see email', '57.5', 'Done', 'Paid', '2020-12-06 15:28:43', 1),
(302, '74', 'soffa', '67', '', 'Photoshop ( *TIFF; *TIF )', '48 hrs', '9', '', '7.2', 'Done', 'Paid', '2020-12-07 13:01:51', 1),
(303, '34', 'three shots 07/12/20', '67', '', 'Photoshop ( *PSD )', '72 hrs', '3', 'see email', '7.5', 'Done', 'Paid', '2020-12-07 15:17:39', 1),
(304, '73', 'GLS 4', '67', '', 'PNG', '30 hrs', '4', '', '2.4', 'Done', 'Paid', '2020-12-07 15:40:45', 1),
(305, '5', '2020-12-07-KF', '67', '', 'Photoshop ( *PSD )', '30 hrs', '32', 'Please cut out whole piece, metals and stones and put on separate layers. Return as PSD. Thank you.', '80', 'Done', 'Paid', '2020-12-08 06:23:01', 1),
(306, '7', 'Digitec Galaxus AG', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '11', '', '11', 'Done', 'Paid', '2020-12-08 10:04:52', 1),
(307, '5', '2020-12-08-KF-Banner', '67', '', 'Photoshop ( *PSD )', '30 hrs', '1', 'Please cut out whole piece, metals and stones and place on separate layers.', '18', 'Done', 'Paid', '2020-12-08 16:52:26', 1),
(308, '68', 'Adaptive SUTI Colour correction', '69', '10', 'PNG', '72 hrs', '10', 'Colour Correction to master image SUTI_009 ( white vehicle )\n5 versions\n1: white vehicle to vw-amarok-orange\n2: white vehicle to AMAROK Red\n3: white vehicle to vw-amarok-green\n4: white vehicle to holden yellow\n5: white vehicle to vw-amarok-pink\n\nTwo Tone Version - Colour Correction to master image S', '10', 'Done', 'Paid', '2020-12-09 05:57:02', 1),
(309, '58', 'Dec 2020', '67', '', 'Photoshop ( *PSD )', '48 hrs', '21', 'Please return jpeg too, thank you', '8.4', 'Done', 'Paid', '2020-12-11 13:14:30', 1),
(310, '35', 'Linen basket', '67', '7', 'Photoshop ( *TIFF; *TIF )', '30 hrs', '6', 'Hello Arif\nI have a new job today with 6 files. Please create a very neat clipping path on all files and also Natural / realistic shadows (drop shadow) on all images. For images 1 ', '4.8', 'Done', 'Paid', '2020-12-11 13:27:00', 1),
(311, '40', 'TFC Everyday', '67', '', 'Photoshop ( *PSD )', '30 hrs', '15', 'Please only remove the grey background, the table can stay. Thank you!', '12', 'Done', 'Paid', '2020-12-12 04:37:18', 1),
(312, '23', '12-12-20-DRP', '67', '', 'Photoshop ( *PSD )', '30 hrs', '27', 'Please make clipping paths for whole piece from background.', '21.60', 'Done', 'Paid', '2020-12-13 07:09:03', 1),
(313, '23', '12-13-20-DRP', '67', '', 'Photoshop ( *PSD )', '30 hrs', '15', 'Please cut out whole piece and put on separate layers. \nThank you.', '12', 'Done', 'Paid', '2020-12-14 00:40:54', 1),
(314, '68', 'Adaptive SUTI Colour correction_UPDATE', '68', '10', 'PNG', '30 hrs', '1', 'Link:   www.clippingpathhouse.com/job_download_link/December_2020/1112/3286_Output.zip\n\n\nClearer Revised Brief:\n\nWe require 9 versions of to the same Master Image SUTI_009\n\nColour Correction the common master image: SUTI_009 ( white vehicle )\n5 versions\n1: image SUTI_009 white vehicle colour correct', '00', '', 'Free', '2020-12-14 03:19:44', 1),
(315, '34', '2 images 15/12/20', '67', '', 'Photoshop ( *PSD )', '48 hrs', '2', 'see email', '4', 'Done', 'Paid', '2020-12-15 16:35:47', 1),
(316, '79', 'Grey background removing', '75', '', 'Photoshop ( *PSD )', '7 days', '1', 'remove background only', '1', 'Waiting for Payment', 'Due', '2020-12-20 23:25:14', 1),
(317, '34', '21/12/20 2 images', '67', '', 'Photoshop ( *PSD )', '48 hrs', '2', '', '4', 'Done', 'Paid', '2020-12-21 17:50:40', 1),
(318, '5', '2020-12-23-KF', '67', '', 'Photoshop ( *PSD )', '30 hrs', '53', 'Please cut out whole piece, metals and stones. Place on separate layers.', '142.00', 'Done', 'Paid', '2020-12-24 19:08:13', 1),
(319, '80', 'Ed', '67', '7', 'Photoshop ( *PSD )', '30 hrs', '40', 'Remove to white background', '20', 'Done', 'Due', '2020-12-27 05:39:48', 1),
(320, '25', 'Dec clips3rd try', '67', '', 'PNG', '48 hrs', '34', '', '20.40', 'Done', 'Paid', '2020-12-28 18:07:46', 1),
(321, '77', 'as', '67', '7', 'Photoshop ( *PSD )', '7 days', '1', 'fdfdf', '20', 'Done', 'Paid', '2020-12-31 05:12:35', 1),
(322, '68', 'AMAROK Surf Rescue', '69', '10', 'PNG', '7 days', '1', 'Morning Arif,\n\nHappy New Year \nto you and your Teamâ€¦\n\nI have 2 retouching projects, first of which is below,\nwith the second following on another work orderâ€¦.\n\nAMAROK Surf Rescue\n\nTurn Image Suti_013 into a Surf Rescue Vehicle\nfollow MOCKUP Image: AMAROK_ SURF RESCUE_mockup\n\n1: Add Surf Life Sav', NULL, NULL, NULL, '2021-01-03 23:03:53', 1),
(323, '68', 'AMAROK Army', '69', '10', 'PNG', '7 days', '1', 'Extend Amarok AMRY\n\nArif, \nour business is Wheelbase Extension to the Volkswagen Amarok\nWe cut and move the rear wheels, back 650mm and adding insert panel\n\nWe would like you to do the same to \nImage: ARMY AMAROK\nReference Images: VETH_XXL_reference  and IMG-2088 XXL reference\n\nRETOUCH Reference Moc', NULL, NULL, NULL, '2021-01-03 23:21:25', 1),
(324, '68', 'Adaptive AMAROK Mining', '69', '7', 'PNG', '7 days', '1', 'AMAROK Mining\n\nImage: AMAROK_Mining_IMG_3259\n\n1: Contour with Clipping Path\n2: Create or retail Drop Shadow\n3: Clean our Windows with tone\n4: Add Vehicle Number 744 to Rear Door, copy from IMAGE: Mining 1\n5: ADD Front Bull Bar, copy from IMAGE: Mining 2\n6: ADD / Copy Yellow Safety Strip, along side ', NULL, NULL, NULL, '2021-01-04 01:14:31', 1),
(325, '68', 'Adaptive XL with Canopy_contour', '67', '7', 'PNG', '7 days', '1', '\nImage: AMAROK_Mining_IMG_3259\n( is part of earlier job AMAROK Mining... may help )\n\n1: Contour with Clipping Path\n2: Create or retail Drop Shadow\n3: Clean our Windows with tone\n', NULL, NULL, NULL, '2021-01-04 01:28:45', 1),
(326, '68', 'Adaptive XL with Tradesman Tray_ Contour', '67', '7', 'PNG', '7 days', '1', 'Image: IMG_4357\n\n1: Contour with Clipping Path\n2: Create or retail Drop Shadow\n3: Clean our Windows with tone\n', NULL, NULL, NULL, '2021-01-04 01:37:00', 1),
(327, '68', 'Adaptive XXL Utility_Drop Shadow', '67', '7', 'PNG', '7 days', '1', 'File is on your system from\n\n2020-11-11 00:59:15\nAdaptive VGA Web Site\n\nmaybe of help....\n\n1: Image is already clipping path\n2: Create / Add drop shadow', NULL, NULL, NULL, '2021-01-04 01:48:11', 1),
(328, '68', 'Adaptive XXL_Tip Top Service Tray_Drop Shahow', '67', '7', 'PNG', '7 days', '1', 'File is on your system from\n\n2020-11-11 00:59:15\nAdaptive VGA Web Site\n\nmaybe of help....\n\n1: Image is already clipping path\n2: Create / Add drop shadow', NULL, NULL, NULL, '2021-01-04 01:50:54', 1),
(329, '68', 'Adaptive XXL with Canopy', '69', '10', 'PNG', '7 days', '1', 'Master Image: IMG_3112\n\nClip ', NULL, NULL, NULL, '2021-01-04 02:19:18', 1),
(332, '84', 'Fathead Sample', '67', '', 'Photoshop (*EPS )', '30 hrs', '1', 'I\'d like the background removed and clipping path added. The clipping path should have minimal points as this will be a print/cut job on a flatbed printer / cutter. This is for a sample of larger run.', NULL, NULL, NULL, '2021-01-06 18:17:57', 1),
(333, '77', 'asasas', '67', '7', 'Photoshop ( *PSD )', '7 days', '126', 'hgfgfhgfhhfg', '60', 'Waiting for process', 'Due', '2021-01-10 07:14:02', 1),
(336, '15', 'KK Clip', '67', '8', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '53', 'Please clip, web optimize and crop tight around image ', '42.40', 'Done', 'Paid', '2021-01-11 23:59:27', 1),
(337, '5', '2021-01-11-KF', '67', '', 'Photoshop ( *PSD )', '30 hrs', '27', 'Please cut out whole piece, metals and stones and place on separate layers. Returns as layered PSD. Thank you.', '93', 'Done', 'Paid', '2021-01-12 04:25:54', 1),
(338, '86', 'photoshop copy and paste tile on floor and fireplace and 3 strips spread apart', '69', '8', 'Photoshop ( *PSD )', '72 hrs', '1', 'new tile in floor over carpet and wall install lights and fireplace retouching', NULL, NULL, NULL, '2021-01-19 20:35:13', 1),
(339, '5', '2021-01-21-KF-Pt-1', '67', '', 'Photoshop ( *PSD )', '30 hrs', '26', 'Please cut out whole piece, metals and stones and place on separate layers. Thank you.', '73', 'Done', 'Paid', '2021-01-22 05:43:35', 1),
(340, '5', '2021-01-21-KF-Pt-2', '67', '', 'Photoshop ( *PSD )', '30 hrs', '23', 'Please cut out whole piece, metals and stones and place on separate layers. Thank you.', '5', 'Done', 'Paid', '2021-01-22 05:54:03', 1),
(341, '5', '2021-01-21-KF-Pt-3', '67', '', 'Photoshop ( *PSD )', '30 hrs', '16', 'Please cut out whole piece, metals and stones and place on separate layers. Thank you.', '00', 'Done', 'Free', '2021-01-22 06:06:43', 1),
(342, '5', '2021-01-21-KF-Pt-4', '67', '', 'Photoshop ( *PSD )', '30 hrs', '24', 'Please cut out whole piece, metals and stones and place on separate layers. Thank you.', '5', 'Done', 'Paid', '2021-01-22 06:16:24', 1),
(344, '25', 'Valentine Choclates', '67', '', 'PNG', '48 hrs', '37', '', '22.20', 'Done', 'Paid', '2021-01-25 19:05:35', 1),
(345, '25', 'Dental product', '67', '', 'PNG', '48 hrs', '15', '', '9', 'Done', 'Paid', '2021-01-26 16:00:39', 1),
(346, '88', '2021-01-27 Alexis', '69', '', 'Photoshop ( *PSD )', '7 days', '1', 'Please remove flyaway hair from around the model\'s head. DO NOT retouch the face.', '1', 'Waiting for Payment', 'Due', '2021-01-27 19:10:15', 1),
(347, '23', '01-26-21-DRP', '67', '', 'Photoshop ( *PSD )', '30 hrs', '42', 'Please cut out whole piece and hanger from background.', '33.60', 'Done', 'Paid', '2021-01-28 07:46:05', 1),
(348, '5', '2021-01-28-KF-Pt-1', '67', '', 'Photoshop ( *PSD )', '30 hrs', '22', 'Please cut out whole piece from background. Cut out individual metals and stones and place on separate layers.', '48', 'Done', 'Due', '2021-01-30 20:14:01', 1),
(349, '5', '2021-01-28-KF', '67', '', 'Photoshop ( *PSD )', '30 hrs', '25', 'Please cut out whole piece from background. Cut out individual metals and stones and place on separate layers.', '73', 'Done', 'Due', '2021-01-30 20:28:40', 1),
(351, '5', '2021-02-02-KF', '67', '', 'Photoshop ( *PSD )', '30 hrs', '12', 'Cut out whole piece from background. Cut out metals and stones and place all on separate layers.', '32', 'Done', 'Paid', '2021-02-03 05:05:33', 1),
(352, '35', 'Cups - February 2021', '67', '7', 'Photoshop ( *TIFF; *TIF )', '30 hrs', '12', 'Hello Arif\nI hava a new job for you today with 10 files. Please create a very neat clpping path on all images - together with Natural / Realistic shadows. I have included 2 examples for the shadows from a previous job. Please return the files as Tiffs with the shadows on a separate layer. If possibl', '9.60', 'Done', 'Paid', '2021-02-03 10:33:57', 1),
(353, '34', '03/02/21 three images', '67', '', 'Photoshop ( *PSD )', '48 hrs', '3', 'quote requested, see email', '7', 'Done', 'Paid', '2021-02-03 13:38:00', 1),
(354, '23', '2021-02-02-KB', '67', '', 'Photoshop ( *PSD )', '30 hrs', '5', 'Please clip out whole pieces from background, stones and metals and place on separate layers.', '75', 'Done', 'Paid', '2021-02-03 17:20:47', 1),
(355, '93', 'First Job Headphones', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '7', '', '2.8', 'Done', 'Paid', '2021-02-05 04:45:27', 1),
(356, '34', '10/02/21 3 images', '67', '', 'Photoshop ( *PSD )', '48 hrs', '3', 'quote requested, see email', '7', 'Done', 'Paid', '2021-02-10 09:05:23', 1),
(357, '93', 'Speakers', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '23', 'clipping path around product', '9.20', 'Done', 'Paid', '2021-02-10 20:31:14', 1),
(358, '5', '2012-02-10-KF', '67', '', 'Photoshop ( *PSD )', '30 hrs', '26', 'Please cut out whole piece, metals and stones and place on separate layers.', '67', '', 'Paid', '2021-02-11 02:04:06', 1),
(359, '5', '2021-02-10-KF-Pt-2', '67', '', 'Photoshop ( *PSD )', '30 hrs', '26', 'Please cut out whole piece from background, metals and stones and place o separate layers. I tried uploading a moment ago and it looks like it failed. Please do not duplicate files. Thank you.', '63', 'Done', 'Paid', '2021-02-11 02:46:31', 1),
(360, '73', 'GLS 2021-02', '67', '', 'Photoshop ( *PSD )', '72 hrs', '2', '', '$1.20', '', 'Paid', '2021-02-12 14:06:33', 1),
(361, '15', 'KK CLIP AND BACKGROUND 2', '67', '8', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '19', 'Please clip product, web obtimize and place images on clear or white background and also on a black background', '$13.30', 'Done', 'Paid', '2021-02-12 23:47:10', 1),
(362, '7', 'Digitec Galaxus AG', '67', '', 'Photoshop ( *PSD )', '30 hrs', '1', '', '$1.00', 'Done', 'Due', '2021-02-16 09:53:55', 1),
(363, '34', '16/025/21 1 image', '67', '', 'Photoshop ( *PSD )', '48 hrs', '1', '', '$2.00', 'Done', 'Paid', '2021-02-16 10:10:20', 1),
(364, '99', 'JOB 1 CATALOGUE', '67', '', 'undefined', '15 hrs - Price will be double', '1', '1.  Please DELETE the following pages :\n\n         Page 50 and 51\n         Page 52 and 53\n         Page 54 and 55\n         Page 58 and 59\n         Page 64 until 69\n         \n2. Please adjust the TABLE OF CONTENTS\n\n3. Kindly change the design of the cover to just the LOGO only.\n\n4. Kindly send me retu', '$5.00', 'Done', 'Paid', '2021-02-16 21:37:09', 1),
(365, '99', 'JOB 1 CATALOGUE', '67', '', 'undefined', '30 hrs', '1', 'PLEASE SEE ATTACHED FILE...I HAVE GIVEN INSTRUCTIONS IN THE PREVIOUS JOB BUT FAILED TO ATTACHED THE FILE', '$5.00', 'Done', 'Paid', '2021-02-17 17:29:52', 1),
(366, '93', 'job3', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '7', '', '2.80', 'Done', 'Paid', '2021-02-18 18:54:33', 1),
(367, '93', 'job4', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '13', 'clip product', '5.20', 'Done', 'Paid', '2021-02-18 18:56:54', 1),
(368, '5', '2021-02-19-Pt-1', '67', '', 'Photoshop ( *PSD )', '30 hrs', '20', 'Please cut out whole piece, metals and stones and place on separate layers.', '$80.00', 'Done', 'Paid', '2021-02-20 05:07:46', 1),
(369, '5', '2021-02-19-Pt-2', '67', '', 'Photoshop ( *PSD )', '30 hrs', '20', 'Please cut out whole piece, metals and stones and place on separate layers.', '$80.00', 'Done', 'Paid', '2021-02-20 05:17:57', 1),
(371, '5', '2021-02-23-Pt-1', '67', '', 'Photoshop ( *PSD )', '30 hrs', '20', 'Please cut out whole piece, stone and different kinds / colors of metal and put on separate layers. Please make sure to cut out the white gold and the yellow gold and put on separate layers. Thank you.', '$70.00', '', 'Due', '2021-02-25 00:06:54', 1),
(372, '5', '2021-02-23-KF-Pt-2', '67', '', 'Photoshop ( *PSD )', '30 hrs', '22', 'Please cut out whole piece, stone and different kinds / colors of metal and put on separate layers. Please make sure to cut out the white gold and the yellow gold and put on separate layers. Thank you.', '$50.00', '', 'Due', '2021-02-25 00:15:00', 1),
(373, '100', 'O.K. Batch 1', '67', '8', 'Photoshop ( *PSD )', '30 hrs', '6', 'Please cutout background, select paths for each color stone, thread and metal. If possible, can you round out each piece?', '15.00', 'Done', 'Paid', '2021-02-25 22:22:25', 1),
(374, '55', 'a-z 14', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '14', 'Clipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', '7.00', 'Done', 'Paid', '2021-03-02 14:07:27', 1),
(375, '55', 'Brighton x 6', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '6', 'Clipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', '3.00', 'Done', 'Paid', '2021-03-02 16:55:40', 1),
(376, '93', 'Microphone', '75', '', 'PNG', '30 hrs', '3', 'for image micro.jpg clipping path other 3 images remove background, need a good mask for hair as background is being replaced', '3.00', 'Done', 'Paid', '2021-03-04 07:04:01', 1),
(377, '58', '2021', '67', '', 'Photoshop ( *PSD )', 'undefined', '10', 'Hello please return as JPEG too, thanks, also there are two pictures with disco lights on the floor, I want to keep the floor inside and the lights.', '4.00', 'Done', 'Paid', '2021-03-04 15:51:52', 1),
(378, '100', '2021-3-5 O.K. Design', '67', '8', 'Photoshop ( *PSD )', '30 hrs', '18', 'Please cut out backgrounds and create paths for different color stones and metals. Can you also do color correction? Thanks!', '45.00', 'Done', 'Paid', '2021-03-05 08:14:39', 1),
(379, '34', '05/03/21 5 images', '67', '', 'Photoshop ( *PSD )', '72 hrs', '5', 'quote requested, see email', '12.00', 'Done', 'Paid', '2021-03-05 17:36:13', 1),
(380, '5', '2021-03-05-KF-Pt-1', '67', '', 'Photoshop ( *PSD )', '30 hrs', '22', 'Please cut out whole piece, metals and stones and place on separate layers.', '52.00', 'Done', 'Paid', '2021-03-07 20:59:08', 1),
(381, '5', '2021-03-05-KF-Pt-2', '67', '', 'Photoshop ( *PSD )', '30 hrs', '18', 'Please cut out whole piece, metals and stones and place on separate layers.', '54.00', 'Done', 'Paid', '2021-03-07 21:06:50', 1),
(382, '55', '22', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '22', 'Clipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', '11.00', 'Done', 'Paid', '2021-03-08 15:38:15', 1),
(383, '58', 'march', '67', '', 'Photoshop ( *PSD )', '48 hrs', '8', 'Please return JPEG too, please keep the floating balls on the pictures', '3.20', 'Done', 'Paid', '2021-03-10 16:30:59', 1),
(384, '58', 'march', '67', '', 'Photoshop ( *PSD )', '48 hrs', '8', 'Please return JPEG too, please keep the floating balls on the pictures', '3.20', 'Done', 'Paid', '2021-03-10 16:31:02', 1),
(385, '102', 'Kush Queen March 2021', '75', '7', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '2', 'Images on the white backdrop should be given a completely white background sRGB value of 0/0/0\n\nImages on pink paper should be given a background with sRGB value 225/157/158\n\nAll images should include the existing shadow in the original photo.  Please allow the existing shadow to softly extend aroun', NULL, NULL, NULL, '2021-03-11 09:02:49', 1),
(386, '102', 'KQ 03-11-2021', '75', '7', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '62', 'Images on the white background should be replaced with pure white (sRGB 0/0/0).\n\nImages on the pink background should be replaced with solid pink (sRGB 225/157/158)\n\nThe original shadows should be used.  Shadows should be blended back in slightly on the area around the product to create a more natur', '24.00', '', 'Paid', '2021-03-11 09:49:42', 1),
(387, '51', 'Oils', '68', '', 'Photoshop ( *PSD )', '5 days', '85', 'Mask out the background with good clean masks around the product please. Return as a layered psd file with the mask on its own layer.', '25.50', 'Done', 'Paid', '2021-03-11 23:47:07', 1),
(388, '93', 'Large speaker', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '4', '', '1.60', 'Done', 'Paid', '2021-03-12 22:15:53', 1),
(389, '104', 'collagenesis_rose - Test', '69', '8', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '1', 'Directions for the Jar: clip to white on a transparent layer, fade reflection at bottom, cleanup metal, remove type reflecting at base, brighten', NULL, NULL, NULL, '2021-03-15 23:33:47', 1),
(390, '104', 'collagenesis_rose - Test', '69', '8', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '1', 'Directions for the Jar: clip to white on a transparent layer, fade reflection at bottom, cleanup metal, remove type reflecting at base, brighten', NULL, NULL, NULL, '2021-03-15 23:34:01', 1),
(391, '34', '16-03-21 12 images', '67', '', 'Photoshop ( *PSD )', '48 hrs', '12', 'quote requested, see email', '24.00', 'Done', 'Paid', '2021-03-16 12:03:41', 1),
(392, '93', 'Halo4969', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '72 hrs', '69', 'clip product', '27.60', 'Done', 'Paid', '2021-03-16 16:15:59', 1),
(393, '5', '2021-03-16-KF-Pt-1', '67', '', 'Photoshop ( *PSD )', '30 hrs', '20', 'Please cut out whole piece, metals and stones and place on separate layers.', '72.00', 'Done', 'Paid', '2021-03-18 00:28:42', 1),
(394, '5', '2021-03-16-KF-Pt-2', '67', '', 'Photoshop ( *PSD )', '30 hrs', '20', 'Please cut out whole piece, metals and stones and place on separate layers.', '40.00', 'Done', 'Paid', '2021-03-18 00:44:36', 1),
(395, '51', 'Coffee Bags', '68', '', 'Photoshop ( *PSD )', '30 hrs', '25', 'Good clean masks around the bags. Mask out the background. Send back as a layered psd file with the mask on its own layer. Thank you!', '10.00', 'Done', 'Paid', '2021-03-19 17:27:07', 1),
(396, '51', 'Coffee Bags 2', '68', '', 'Photoshop ( *PSD )', '5 days', '87', 'Good clean masks. mask out the background. Return as a layered psd file with the mask on its own layer.\nThank you.', '34.80', 'Done', 'Paid', '2021-03-19 17:32:10', 1),
(397, '51', 'Coffee Bags 3', '68', '', 'Photoshop ( *PSD )', '5 days', '86', 'Good clean masks. mask out the background. Return as a layered psd file with the mask on its own layer.\nThank you.', '34.40', 'Done', 'Paid', '2021-03-19 17:34:42', 1),
(398, '7', 'Digitec Galaxus AG', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '62', '', '62', 'Done', 'Paid', '2021-03-22 15:34:08', 1),
(399, '106', 'FS Groups', '67', '7', 'Photoshop ( *PSD )', '30 hrs', '2', 'wetransffered PSF files, these screenshots are for illustrative purposes only, please do not use these screenshots. to cut out these 8 individuals, and assemble these 2 group shots on pure white background with subtle shadows under the feet, keeping each person as a layer. Download link \nhttps://we.', '13.00', 'Done', 'Paid', '2021-03-23 01:21:40', 1),
(400, '11', 'WP 180321', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '1', 'Please could you return all of the files with pure white backgrounds and no shadows around the guns.  I need each file returned as a minimum of 2mb per file please.  In total there should be 82 files. As usual a quick turn around is much appreciated.  Many thanks', '00.00', 'Done', 'Free', '2021-03-23 22:06:33', 1),
(401, '11', 'WP180321', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '82', 'Hi\nAttaching 82 files.  Please could you return with pure white backgrounds and no shadows.  I need the files back as 2mb per file please where possible and as soon as possible please.\n\nMany thanks\nAmelia', '25.40', 'Done', 'Paid', '2021-03-24 14:27:08', 1),
(402, '107', 'Clipping path ', '67', '', 'PNG', '30 hrs', '16', 'Hi, I have set a cross over subjects that must be taken away, in case of doubt. Please correct perspective on objects facing straight forward. image: 026_1, 0029_1, . And please straighten black cord in images: 0029, 0034, and 0015.\n\nThank you.', '6.40', 'Done', 'Paid', '2021-03-24 15:53:38', 1),
(403, '', 'AtR Set 11', '67', '7', 'Photoshop ( *TIFF; *TIF )', '48 hrs', '1', 'Please do not flatten layers in Photoshop', NULL, NULL, NULL, '2021-03-24 19:48:18', 1),
(404, '', 'AtR Set 11', '67', '7', 'Photoshop ( *TIFF; *TIF )', '72 hrs', '1', 'Please don\'t flatten layers in Photoshop. I had trouble uploading the files on your site here so I used Dropbox: https://www.dropbox.com/sh/9lawy61su85j9zv/AAA9NI8ERXaiEQk7O7KpdPaha?dl=0\n\nThere are eight images that need clipping. Thanks!', NULL, NULL, NULL, '2021-03-25 13:35:46', 1),
(405, '108', 'elencolux210325', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '19', 'background transparent', '9.50', 'Waiting for Payment', 'Due', '2021-03-25 16:10:02', 1),
(406, '93', 'job5', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '15 hrs - Price will be double', '8', 'clip products, on image with ping pong net and paddles do not include white board underneath', '8.00', 'Done', 'Paid', '2021-03-26 05:24:53', 1),
(407, '5', '2021-03-25-KF', '67', '', 'Photoshop ( *PSD )', '30 hrs', '19', 'Cutout metal and stones as separate layers please.', '69.00', 'Done', 'Paid', '2021-03-26 05:59:08', 1),
(408, '51', 'Oils 2', '68', '', 'Photoshop ( *PSD )', '72 hrs', '22', 'Good clean masks around product. Mask out the background and return as a layered psd file. Thank you!', '8.80', 'Done', 'Paid', '2021-03-26 17:39:26', 1),
(409, '51', 'Oils 3', '68', '', 'Photoshop ( *PSD )', 'undefined', '27', 'Good clean masks around product. Mask out the background and return as a layered psd file. Thank you!', '10.80', 'Done', 'Paid', '2021-03-26 17:46:18', 1),
(410, '51', 'Oils 4', '68', '', 'Photoshop ( *PSD )', 'undefined', '6', 'Good clean masks around product. Mask out the background and return as a layered psd file. Thank you!', '2.40', 'Done', 'Paid', '2021-03-26 17:57:23', 1),
(411, '55', 'SHIRTS X 66', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '66', 'Clipping path around shirt and model/mannequin. \nPaths need to be as accurate as possible. Please return as jpeg on original background.\n\n$0.30 Cents half view images.\n$0.40 Cents full view images.', '$33.00', 'Done', 'Paid', '2021-03-29 14:50:47', 1),
(412, '106', 'Nicole', '67', '7', 'Photoshop ( *PSD )', '30 hrs', '1', '5 individuals cut out, to assemble the group shots on pure white background with subtle shadows under the feet (also, not sure if its possible for you to help match the woman on the right to the tones of the rest of the people)', NULL, NULL, NULL, '2021-03-30 01:07:24', 1),
(413, '93', 'job5', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '15 hrs - Price will be double', '5', 'clipping path for product and also a path for the screen', '5.00', 'Done', 'Paid', '2021-03-30 04:36:00', 1),
(414, '109', 'Miro aniv', '68', '', 'Photoshop ( *PSD )', '5 days', '77', 'I accept the budget of 50c per single image and 70c for couple, I hope that this fill in 5 days delivery. Please, be accurate with hair, the images will be mounted with dark backgrounds. Thank you', '40.50', 'Done', 'Paid', '2021-04-01 08:23:54', 1),
(415, '5', '2021-03-25-KF Pt 2', '67', '', 'Photoshop ( *PSD )', '72 hrs', '42', 'Please cutout metal and stones in separate layers.', '148.00', 'Done', 'Paid', '2021-04-01 15:04:03', 1),
(416, '23', '04-02-21-DRP-Pt-1', '67', '', 'Photoshop ( *PSD )', '30 hrs', '26', 'Please create cut path for whole piece from background.', '20.80', 'Done', 'Paid', '2021-04-03 03:18:41', 1),
(417, '23', '04-02-21-DRP-Pt-2', '67', '', 'Photoshop ( *PSD )', '30 hrs', '25', 'Please create cut path for whole piece from background.', '20.00', 'Done', 'Paid', '2021-04-03 03:22:26', 1),
(418, '110', 'Audi e-tron', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '18', 'Please do Outline path for the car like today in your free trial sample which was perfect\n', '10.00', 'Waiting for Payment', 'Paid', '2021-04-03 20:30:28', 1),
(419, '51', 'BD boxes 1', '68', '', 'Photoshop ( *PSD )', '48 hrs', '14', 'Good clean masks around boxes and boxes with cake/cookie slices. Mask out the backgrounds. Return as layered psd files. Thank you!', '7.00', 'Waiting for Payment', 'Paid', '2021-04-04 01:06:44', 1),
(420, '111', 'Vasse', '75', '', 'Photoshop (*EPS )', '72 hrs', '87', '', '69.60', 'Done', 'Paid', '2021-04-04 07:02:45', 1),
(421, '51', 'BD Cups/Spoons', '68', '', 'Photoshop ( *PSD )', '48 hrs', '17', 'Good ,clean masks around the Tasty Little Cups. Mask out the background. Mask around the SPOONS cutting out the background and white cups, leaving only the spoons. Return as layered psd files. Thank you.', '10.20', 'Done', 'Paid', '2021-04-07 15:56:25', 1),
(422, '110', 'audi etron 2', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '11', '', '5.50', 'Done', 'Paid', '2021-04-07 20:08:29', 1),
(423, '110', 'audi etron 2', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '11', '', '5.50', 'Done', 'Paid', '2021-04-07 20:08:31', 1),
(424, '23', '2021-04-07-KB-MD', '67', '', 'Photoshop ( *PSD )', '30 hrs', '1', 'Pleases cut out whole pieces from background, metals on separate layers and stones and place on separate layers. Thank you', '20.00', 'Done', 'Paid', '2021-04-07 21:59:02', 1),
(425, '111', 'H', '75', '', 'Photoshop ( *PSD )', '48 hrs', '38', '', '30.40', 'Done', 'Paid', '2021-04-08 07:33:31', 1),
(426, '110', 'Audi A3 ', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '15 hrs - Price will be double', '1', 'can you please do the outside path of the car from the following wetransfer link  https://we.tl/t-7WNLk1leRE ', '00.00', 'Done', 'Free', '2021-04-09 01:37:48', 1),
(427, '93', 'Composite', '69', '', 'Photoshop ( *PSD )', '30 hrs', '3', 'use girl jpeg as base file, remove the background and replace with background with chalkboard.jpg remove the headphones from girl and replace with rhinestone headphones from the Girls Headphone Rhinestone.jpeg      Please contact me with a quote before proceeding Thank you', '1.00', 'Done', 'Paid', '2021-04-10 00:54:36', 1),
(428, '93', 'headphones rhinestone', '68', '', 'PNG', '30 hrs', '2', 'remove background from girl.jpg \nclip out headphones from Girls Headphone Rhinestone.jpeg', '1.00', 'Done', 'Paid', '2021-04-10 00:56:20', 1),
(429, '23', '2021-04-12-KB', '67', '', 'Photoshop ( *PSD )', '30 hrs', '3', 'Please cut out whole piece from background, cut out stones and cut out metals and place on separate layers.', '13.00', 'Done', 'Paid', '2021-04-13 02:37:05', 1),
(430, '99', 'job arnotts', '67', '8', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '7', 'size - 1200 x 800\nlandscape\nWhite Background\nno shadows\ncrop if needed\nweb optimazation', '5.60', 'Done', 'Paid', '2021-04-13 16:50:23', 1),
(431, '23', 'DRP-Pt-3', '67', '', 'Photoshop ( *PSD )', '30 hrs', '8', 'Please cut out product from background and place on separate layer. Thank you.', '8.00', 'Done', 'Paid', '2021-04-14 19:25:53', 1),
(432, '93', 'neck massager 4', '68', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '15 hrs - Price will be double', '4', 'Please create alpha mask for the neck massager', '6.40', 'Done', 'Paid', '2021-04-16 14:26:06', 1),
(433, '93', 'hands', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '15 hrs - Price will be double', '17', '', '8.50', 'Done', 'Paid', '2021-04-17 17:20:55', 1),
(434, '5', '2021-04-16-KF-Pt-1', '67', '', 'Photoshop ( *PSD )', '30 hrs', '17', 'Please cut out whole piece from background, cutout metals and stones and place on separate layers.', '85.00', 'Processing', 'Paid', '2021-04-17 20:54:55', 1),
(435, '5', '2021-04-16-KF-Pt-2', '67', '', 'Photoshop ( *PSD )', '30 hrs', '10', 'Please cut out whole piece from background, metals and stones and place on separate layers. ', '40.00', 'Waiting for process', 'Paid', '2021-04-17 21:02:50', 1),
(436, '110', 'Abt A3 Photos ', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '1', 'Please do outside path line from the following Retransfer link https://we.tl/t-10f8TyZQ9M\n', '00.00', 'Done', 'Free', '2021-04-18 14:44:21', 1),
(437, '110', 'INteriour', '69', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '1', 'Could you please do the stitches of the seat in red like I marked allready in several parts \n\nPlease grab the red color from my samples inside the Picture\nPlease transfer all white stitches into red stitches \n\nThank you ', NULL, NULL, NULL, '2021-04-20 02:53:14', 1),
(438, '110', 'INteriour 2', '69', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '5', 'Please do again red stiching against the original white one, samples are already inside the Pictures where you can grab the color ', NULL, NULL, NULL, '2021-04-21 02:18:35', 1),
(439, '35', 'Watches', '67', '7', 'Photoshop ( *TIFF; *TIF )', '30 hrs', '2', 'Hi Arif - How are you today, we are still in lockdown in Ireland and work is very slow here. I have a small job for you today with 2 files. I hope to have more work when everything opens up. Hope you are all keeping safe at CPH. Please create a very neat clipping path / image mask  together a natura', '1.60', 'Done', 'Paid', '2021-04-27 12:18:37', 1),
(440, '93', 'Speakers 21', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '18', 'clip out product', '7.20', 'Done', 'Paid', '2021-04-28 03:16:51', 1),
(441, '23', 'DRP-04-27-21', '67', '', 'Photoshop ( *PSD )', '30 hrs', '24', 'Please cut out whole piece from background and place on separate layer.', '19.20', 'Done', 'Paid', '2021-04-28 06:09:05', 1),
(442, '5', '2021-04-28-KF-Pt-1', '67', '', 'Photoshop ( *PSD )', '30 hrs', '20', 'Please cut out whole piece, metals and stones and place on separate layers.\nThank you.', '81.00', 'Done', 'Paid', '2021-04-29 03:51:07', 1),
(443, '5', '2021-04-28-KF-Pt-2', '67', '', 'Photoshop ( *PSD )', '30 hrs', '19', 'Please cut out whole piece metals and stones and place on separate layers. Thank you.', '76.00', 'Done', 'Paid', '2021-04-29 03:59:59', 1),
(444, '93', 'FAO', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '15 hrs - Price will be double', '3', 'clip out products \ncase, train and tracks', '5.00', 'Done', 'Paid', '2021-04-30 16:52:59', 1),
(445, '93', '3 more', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '15 hrs - Price will be double', '3', 'clip out product', '2.40', 'Processing', 'Paid', '2021-04-30 19:29:57', 1),
(446, '34', '01-05-21 7 images', '67', '', 'Photoshop ( *PSD )', '72 hrs', '7', 'quote requested, see email', '14.00', 'Done', 'Paid', '2021-05-01 06:50:04', 1),
(447, '34', '03-05-21 3 images', '67', '', 'Photoshop ( *PSD )', '48 hrs', '3', 'quote requested, see email', '8.00', 'Done', 'Paid', '2021-05-03 13:55:41', 1),
(448, '116', 'LARK 1', '67', '', 'Photoshop ( *TIFF; *TIF )', '30 hrs', '4', '', '1.60', 'Done', 'Paid', '2021-05-05 04:33:38', 1),
(449, '116', 'Lark 2', '67', '', 'Photoshop ( *TIFF; *TIF )', '30 hrs', '7', '', '2.80', 'Done', 'Paid', '2021-05-05 05:17:57', 1),
(450, '116', 'Lark 3', '67', '', 'Photoshop ( *TIFF; *TIF )', '30 hrs', '10', '', '4.00', 'Done', 'Paid', '2021-05-05 05:18:04', 1),
(451, '116', 'Lark 4', '67', '', 'Photoshop ( *TIFF; *TIF )', '30 hrs', '13', 'Create path around product, leave on transparent BG. ', '5.20', 'Done', 'Paid', '2021-05-05 05:24:57', 1),
(452, '23', 'DRP-05-05-21', '67', '', 'Photoshop ( *PSD )', '30 hrs', '8', 'Please cut out whole piece from background and place on separate layer. Thank you.', '6.40', 'Done', 'Paid', '2021-05-06 17:28:22', 1),
(453, '12', 'KM21', '67', '', 'Photoshop ( *PSD )', '30 hrs', '24', '3 layers\nLayer 1: Original image\nLayer 2: White\nLayer 3: Clipped Jewelry\n-When deleting background, please feather radius by 1px. \n-Please pay attention to accurate path of jewelry\nThese are the prices I normally get charged: \nFor simple      .29  USD (x10 images)\nFor medium   .80  USD (x14 images)\n', '14.10', 'Waiting for Payment', 'Due', '2021-05-07 15:31:32', 1),
(454, '116', 'Lark Day 2 ', '67', '', 'Photoshop ( *TIFF; *TIF )', '30 hrs', '12', 'Create clipping path on transparent', '4.80', 'Done', 'Paid', '2021-05-07 21:37:52', 1),
(455, '116', 'Summer Surprise', '67', '', 'Photoshop ( *TIFF; *TIF )', '30 hrs', '35', '', '42.00', 'Done', 'Paid', '2021-05-08 07:51:53', 1);
INSERT INTO `tbl_register_job` (`id`, `fld_user_id`, `fld_job_title`, `fld_main_service`, `fld_add_service`, `fld_format`, `fld_delivery_time`, `fld_total_files`, `fld_job_instruction`, `fld_amount`, `fld_payment_type`, `fld_payment_status`, `fld_datetime`, `fld_read`) VALUES
(456, '116', 'Summer Sale', '67', '', 'Photoshop ( *TIFF; *TIF )', '30 hrs', '28', '', '$33.60', 'Done', 'Paid', '2021-05-08 08:14:58', 1),
(457, '117', 'Carilux 10052021', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '4', 'no crop , no resize, no retouch', '2.40', 'Processing', 'Due', '2021-05-10 14:51:32', 1),
(458, '73', 'olu', '68', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '17', 'always mask the lamp, the cable and the two hangers. ', '10.20', 'Done', 'Paid', '2021-05-10 20:04:36', 1),
(459, '23', 'DRP-2021-05-12-Pt-1', '67', '', 'Photoshop ( *PSD )', '30 hrs', '15', 'Please cut out whole piece from background, cut out metals and cut out stones and place each on separate layers. Thank you!', '55.00', 'Done', 'Paid', '2021-05-12 16:00:13', 1),
(460, '23', 'DRP-2021-05-12-Pt-2', '67', '', 'Photoshop ( *PSD )', '30 hrs', '10', 'Please cut out whole piece from background, cut out metals and cut out stones and place each on separate layers. Thank you!', '46.00', 'Done', 'Paid', '2021-05-12 16:06:11', 1),
(461, '5', '2021-05-12-KF', '67', '', 'Photoshop ( *PSD )', '30 hrs', '17', 'Please cut out whole piece, metals and stones and place each on separate layers.', '$50.00', 'Done', 'Paid', '2021-05-13 05:22:18', 1),
(462, '5', '2021-05-12-KF-Pt-2', '67', '', 'Photoshop ( *PSD )', '30 hrs', '18', 'Please cut out whole piece, metals and stones and place each on separate layers.', '$53.00', 'Done', 'Paid', '2021-05-13 05:30:28', 1),
(463, '5', '2021-05-12-KF-Pt-3', '67', '', 'Photoshop ( *PSD )', '30 hrs', '19', 'Please cut out whole piece, metals and stones and place each on separate layers.', '$40.00', 'Done', 'Paid', '2021-05-13 05:39:12', 1),
(464, '5', '2021-05-12-Pt-4', '67', '', 'Photoshop ( *PSD )', '30 hrs', '21', 'Please cut out whole piece, metals and stones and place each on separate layers.', '$67.00', 'Done', 'Paid', '2021-05-13 05:47:35', 1),
(465, '5', '2021-05-12-KF-Antique-Banner', '67', '', 'Photoshop ( *PSD )', '30 hrs', '1', 'Please cut out whole pieces, stones and metals and place on separate layers.', '$5.00', 'Done', 'Paid', '2021-05-15 16:01:51', 1),
(466, '23', '05-17-21-DRP', '67', '', 'Photoshop ( *PSD )', '30 hrs', '60', 'Hello please cut out whole piece from background and place on separate layers. Thank you.', '47.00', 'Done', 'Paid', '2021-05-18 08:26:03', 1),
(467, '93', 'Train1', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '15 hrs - Price will be double', '1', 'clip out train', '1.00', 'Done', 'Due', '2021-05-19 00:47:09', 1),
(468, '51', 'LT Group', '68', '', 'Photoshop ( *PSD )', '30 hrs', '4', 'Good clean masks around the products please! Mask out the background and reflections, leaving the products. Return as layered psd files', '6.00', 'Done', 'Paid', '2021-05-20 00:45:48', 1),
(469, '35', 'Ceramics', '67', '7', 'Photoshop ( *TIFF; *TIF )', '30 hrs', '11', 'Hi Arif\nI hope you are keeping well. I have a new job today with 11 files - if possible could you do this one urgent as I suddenly have a deadline (thanks). Please create a very neat clipping path on all files together with Natural and Realistic shadows underneath the pieces. Please create the shado', '8.80', 'Done', 'Paid', '2021-05-21 11:39:41', 1),
(470, '15', 'Billet Parts', '67', '8', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '59', 'Please crop so image 85% of the area, please clip with white background, web optimize ', '41.30', 'Done', 'Paid', '2021-05-21 17:29:59', 1),
(471, '35', 'Ceramics 2', '67', '7', 'Photoshop ( *TIFF; *TIF )', '30 hrs', '9', 'Hi Arif\nI have a new job today with 9 files. Please create a very neat clipping path together with natural / realistic shadows. Please show the shadows on a separate layer and return the files as Tiffs. Many thanks for your help - David Dempsey', '7.20', 'Done', 'Paid', '2021-05-24 09:31:05', 1),
(472, '93', 'Drums', '68', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '7 hrs - Price will be triple', '1', 'Mask for girl and drums', '2.00', 'Done', 'Paid', '2021-05-25 07:38:25', 1),
(473, '35', 'Flowers', '69', '', 'Photoshop ( *PSD )', '30 hrs', '1', 'Hi Arif\nI have one unusual job today. Can you please remove the \'white highlights\' that show up on the flowers piece. If you zoom in close you will see them - please carefully Blend in as if they are not there. I\'m not sure what you will use - maybe spot removal or clone stamp. \nThe normal reflectio', '2.00', 'Done', 'Paid', '2021-05-25 11:56:24', 1),
(474, '93', 'vanity', '67', '7', 'Photoshop ( *PSD )', '15 hrs - Price will be double', '1', 'clip out product and make a layer with shadow ', '2.00', 'Done', 'Paid', '2021-05-25 20:28:25', 1),
(475, '93', 'drums and guitar', '68', '', 'Photoshop ( *PSD )', '15 hrs - Price will be double', '6', 'mask for product, mask for child and product', '7.00', 'Done', 'Paid', '2021-05-26 04:54:11', 1),
(476, '93', 'shadow creation', '75', '7', 'Photoshop ( *PSD )', '15 hrs - Price will be double', '6', 'I had you create masks for these and now I need shadows created follow original for shadow shape', '6.00', 'Done', 'Paid', '2021-05-28 17:30:33', 1),
(477, '110', 'Audi R8 ', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '1', 'Please do outline of the car please download here from wetrans; https://we.tl/t-ViJWTaVOSG', NULL, NULL, NULL, '2021-05-28 20:50:24', 1),
(478, '93', 'guitar amp and crate', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '15 hrs - Price will be double', '1', 'clip out guitar amps/speakers and crate', '1.00', 'Done', 'Paid', '2021-05-28 20:53:11', 1),
(479, '23', '2021-05-31-DRP', '67', '', 'Photoshop ( *PSD )', '30 hrs', '7', 'Please cut out whole piece from background.', '13.00', 'Done', 'Paid', '2021-05-31 17:27:44', 1),
(480, '51', 'SF Bay single pods', '68', '', 'Photoshop ( *PSD )', '15 hrs - Price will be double', '10', 'Good clean masks around package,  masking out the background. Return as layered psd files. Thanks', '$10.00', 'Done', 'Paid', '2021-06-01 19:54:41', 1),
(481, '5', '2021-06-01-Whats-New-Banner', '67', '', 'Photoshop ( *PSD )', '30 hrs', '1', 'Please cut out whole pieces, different metals and different stones and place on separate layers. Thank you.', '$15.00', 'Done', 'Paid', '2021-06-02 02:51:05', 1),
(482, '119', 'Alber Elbaz LeSportSac', '75', '8', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '14', 'Please remove existing backgrounds and replace with clean white background. These are internet product photos.', '$8.40', 'Done', 'Paid', '2021-06-02 03:55:37', 1),
(483, '121', 'Pearl Group', '67', '', 'Photoshop ( *PSD )', '30 hrs', '1', 'Please clip the bracelets inside and outside', NULL, NULL, NULL, '2021-06-02 18:16:08', 1),
(484, '119', 'Alber Elbaz LeSportSac', '75', '8', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '17', 'Please remove background and replace with clean white background', '$10.20', 'Done', 'Paid', '2021-06-03 18:41:53', 1),
(485, '5', '2021-06-01-KF-Pt-1', '67', '', 'Photoshop ( *PSD )', '30 hrs', '21', 'Please cut out whole piece from background, metals and stones and place on separate  layers.', '$75.00', 'Done', 'Paid', '2021-06-03 18:47:12', 1),
(486, '5', '2021-06-01-Pt-2', '67', '', 'Photoshop ( *PSD )', '30 hrs', '20', 'Please cut out whole piece from background, metals and stones and place on separate layers.', '$64.00', 'Done', 'Paid', '2021-06-03 18:55:34', 1),
(487, '5', '2021-06-01-Pt-3', '67', '', 'Photoshop ( *PSD )', '30 hrs', '12', 'Please cut out whole piece from background, cut out metals and stones and place on separate layers.', '$38.00', 'Done', 'Paid', '2021-06-03 19:02:39', 1),
(488, '73', 'cewa', '75', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '72 hrs', '6', 'get a clean white background and add cliping path- thx. dennis ', '00.00', 'Done', 'Free', '2021-06-07 20:21:17', 1),
(489, '73', 'Ceva', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '72 hrs', '6', '', '$4.20', 'Waiting for Payment', 'Due', '2021-06-09 07:41:13', 1),
(490, '110', 'Audi Group ', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '15 hrs - Price will be double', '1', 'please do outline of the cars, and please note that some cars are on the same position for several photos so you can copy/ paste ;-)  here is the Wetransfer Download https://we.tl/t-PIOK7qotLF', NULL, NULL, NULL, '2021-06-09 18:07:59', 1),
(491, '23', '06-07-21-DRP', '67', '', 'Photoshop ( *PSD )', '30 hrs', '41', 'Please cut out whole piece from background and place on separate layers.', '$60.00', 'Done', 'Paid', '2021-06-10 01:40:43', 1),
(492, '5', '2021-06-08-KF-Pt-1', '67', '', 'Photoshop ( *PSD )', '30 hrs', '24', 'Please cut out whole piece, different metals and stones and place on separate layers. Thank you.', '$61.00', 'Done', 'Paid', '2021-06-10 02:20:00', 1),
(493, '5', '2021-06-08-KF-Pt-2', '67', '', 'Photoshop ( *PSD )', '30 hrs', '23', 'Please cut out whole piece, different metals and stones and place on separate layers. Thank you.', '$73.00', 'Done', 'Paid', '2021-06-10 02:39:59', 1),
(494, '5', '2021-06-08-KF-Pt-3', '67', '', 'Photoshop ( *PSD )', '30 hrs', '28', 'Please cut out whole piece, different metals and stones and place on separate layers. Thank you.', '$92.00', 'Done', 'Paid', '2021-06-10 02:51:43', 1),
(495, '58', 'june 2021', '67', '', 'Photoshop ( *PSD )', '48 hrs', '3', 'Can I have Jpeg too please', '$1.20', 'Done', 'Paid', '2021-06-15 11:46:00', 1),
(496, '58', 'June 21 2', '67', '', 'Photoshop ( *PSD )', '48 hrs', '44', 'can i have jpeg too please', '$17.60', 'Done', 'Paid', '2021-06-15 11:59:41', 1),
(498, '23', '2021-06-22-DRP-1', '67', '', 'Photoshop ( *PSD )', '30 hrs', '16', 'Please cut out whole piece, stones and metals and place on separate layers.', '$62.00', 'Done', 'Paid', '2021-06-23 03:10:41', 1),
(499, '23', '2021-06-22-DRP-2', '67', '', 'Photoshop ( *PSD )', '30 hrs', '15', 'Please cut out whole piece, stones and metals and place on separate layers.', '$70.00', 'Done', 'Paid', '2021-06-23 03:17:50', 1),
(500, '57', 'Path Clipping 23.06.2021', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '72 hrs', '4', 'Hi,\nplease do a path clipping for everything, that is part of the drumset. Also, please don\'t remove anything from the original image.\n\nI kindly ask you to tell me the price for the work upfront. Last time I ordered, I paid 2$ per image.\n\nThanks a lot and have a wonderful day!', '8', 'Done', 'Paid', '2021-06-23 07:57:40', 1),
(501, '11', 'WP 17 06 21 Batch 1', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '94', 'Hi\nThis is the first of two batches (94 files in this batch).  Please could you return all images with pure white backgrounds and no shadows around the guns.  I need the files back as 2mb files please.\nMany thanks\nAmelia', '$37.20', 'Done', 'Paid', '2021-06-24 12:00:35', 1),
(502, '11', 'Batch 2 WP 17062021', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '63', 'Hi \nThis is batch 2 which I need back as soon as possible also for the client (63 files).  Please can you deliver pure white backgrounds with no shadows around the guns.  I need the files back as 2mb please.  Many thanks.', '$26.90', 'Done', 'Paid', '2021-06-24 12:20:00', 1),
(503, '93', 'Keyboards', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '48', 'clip out product', '$19.20', 'Done', 'Paid', '2021-06-25 04:15:26', 1),
(504, '35', 'Golf mats', '67', '7', 'Photoshop ( *TIFF; *TIF )', '30 hrs', '14', 'Hello Arif\nI hope you are keeping well. I have a new job today with 14 files. Please create a very neat clipping path on all files together with a natural / realistic shadow. Please create the shadow on a separate layer and return the files as Tiffs.\n*** For files numbers 7, 12, 13 ', '$11.20', 'Done', 'Due', '2021-06-25 13:46:05', 1),
(505, '5', '2021-06-25-KF-Pt-1', '67', '', 'Photoshop ( *PSD )', '30 hrs', '23', 'Please cut out whole piece, metals and stones and place on separate layers.', '$67.00', 'Done', 'Paid', '2021-06-26 22:12:13', 1),
(506, '5', '2021-06-25-KF-Pt2', '67', '', 'Photoshop ( *PSD )', '30 hrs', '18', 'Pease cut out whole piece, metals, stones and place on seperate layers.', '$42.00', 'Done', 'Paid', '2021-06-26 22:23:50', 1),
(507, '5', '2021-06-25-KF-Pt2', '67', '', 'Photoshop ( *PSD )', '30 hrs', '18', 'Pease cut out whole piece, metals, stones and place on seperate layers.', '$42.00', 'Done', 'Paid', '2021-06-26 22:29:26', 1),
(508, '23', '06-27-21-DRP-1', '67', '', 'Photoshop ( *PSD )', '15 hrs - Price will be double', '41', 'Please cut out whole piece from background and place on separate layers.', '$49.20', 'Done', 'Paid', '2021-06-28 06:06:49', 1),
(509, '23', '06-28-21-DRP-2', '67', '', 'Photoshop ( *PSD )', '15 hrs - Price will be double', '30', 'Please cut out whole pieces and place on separate layers. ', '$36.00 USD', 'Done', 'Paid', '2021-06-28 18:15:45', 1),
(510, '34', '30/06/21 two images', '67', '', 'Photoshop ( *PSD )', '72 hrs', '2', 'quote requested, see email', '$3.00', 'Done', 'Paid', '2021-06-30 09:11:01', 1),
(511, '93', 'Batch 1', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '24', 'clip out product include cable', '$9.60', 'Done', 'Paid', '2021-07-01 07:39:35', 1),
(512, '93', 'Batch 2', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '24', 'clip out product include cable', '$9.60', 'Done', 'Paid', '2021-07-01 07:42:00', 1),
(513, '93', 'Batch 3', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '1', 'clip out product include shadow', '$00.40', '', 'Paid', '2021-07-01 07:45:27', 1),
(514, '116', 'W21 PDP PP', '67', '', 'Photoshop ( *TIFF; *TIF )', '72 hrs', '7', 'Please drop or mask background to transparent, whatever is easier/cheaper.', '$8.4', 'Done', 'Paid', '2021-07-01 08:04:20', 1),
(515, '116', 'W21 PDP Laydowns 1 of 4  - 20', '67', '', 'Photoshop ( *TIFF; *TIF )', '72 hrs', '20', 'Please drop background to transparent with clipping or masking- whichever is easier/cheaper.', '$24.00', 'Done', 'Paid', '2021-07-01 08:16:24', 1),
(516, '116', 'W21 PDP Laydowns 2 of 4 - 23', '67', '', 'Photoshop ( *TIFF; *TIF )', '5 days', '22', 'Please drop background to transparent with clipping or masking- whichever is easier/cheaper.', '$26.40', 'Done', 'Paid', '2021-07-01 08:47:33', 1),
(517, '116', 'W21 PDP Laydowns 3 of 4 - 17', '67', '', 'Photoshop ( *TIFF; *TIF )', '5 days', '17', 'Please drop background to transparent with clipping or masking- whichever is easier/cheaper.', '$20.40', 'Done', 'Paid', '2021-07-01 09:07:40', 1),
(518, '116', 'W21 PDP Laydowns 4 of 4 - 18', '67', '', 'Photoshop ( *TIFF; *TIF )', '5 days', '18', 'Please drop background to transparent with clipping or masking- whichever is easier/cheaper.', '$21.60', 'Done', 'Paid', '2021-07-01 13:27:44', 1),
(519, '93', 'BATCH4', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '21', '', '$8.40', 'Done', 'Paid', '2021-07-02 04:43:26', 1),
(520, '93', 'BATCH5', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '28', '', '$11.20', 'Done', 'Paid', '2021-07-02 04:47:11', 1),
(521, '93', 'Batch 3_2', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '48 hrs', '23', '', '$9.20', 'Done', 'Paid', '2021-07-02 15:01:37', 1),
(522, '93', 'Snap stand', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '72 hrs', '24', 'clip out product and cable', '$9.60', 'Done', 'Paid', '2021-07-04 22:56:56', 1),
(523, '116', 'W21 ICONIC', '67', '', 'Photoshop ( *TIFF; *TIF )', '72 hrs', '3', 'Please drop backgrounds via clipping or masking, whichever is easiest/cheapest. 3 images total. Thank you!', '$3.60', 'Done', 'Paid', '2021-07-12 03:05:36', 1),
(524, '55', 'leeds x 3', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '3', 'ASAP please.\nClipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', '$1.50', 'Done', 'Paid', '2021-07-13 12:33:52', 1),
(525, '57', 'Path Clipping 2021/07/14', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '5 days', '3', 'Hi, \nplease do a path clipping for the attached three pictures. Please clip everything that is part of the drumset and don\'t remove anything from the original picture.\n\nI guess it\'s 2$ per image again, right?\n\nThanks a lot!', '$6.00', 'Done', 'Paid', '2021-07-14 07:16:41', 1),
(526, '55', 'Phil babb', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '1', 'Clipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', '$00.50', 'Done', 'Due', '2021-07-15 10:52:01', 1),
(527, '5', '2021-07-15-KF-Pt1', '67', '', 'Photoshop ( *PSD )', '30 hrs', '22', 'Please cut out whole piece, separate metals and stones and place on separate layers. ', '$50.00', 'Done', 'Due', '2021-07-16 17:13:22', 1),
(528, '5', '2021-07-15-KF-Pt1', '67', '', 'Photoshop ( *PSD )', '30 hrs', '22', 'Please cut out whole piece, separate metals and stones and place on separate layers. ', '$50.00', 'Done', 'Due', '2021-07-16 17:13:32', 1),
(529, '5', '2021-07-15-KF-Pt2', '67', '', 'Photoshop ( *PSD )', '30 hrs', '28', 'Please cut out whole piece, separate metals and stones and place on separate layers.', '$78.00', 'Done', 'Due', '2021-07-16 17:28:17', 1),
(530, '5', '2021-07-15-KF-Pt-3', '67', '', 'Photoshop ( *PSD )', '30 hrs', '24', 'Please cut out whole piece, separate metals and stones and place on separate layers. ', '$81.00', 'Done', 'Due', '2021-07-16 17:45:11', 1),
(531, '23', '07-17-21-DRP-Pt-1', '67', '', 'Photoshop ( *PSD )', '15 hrs - Price will be double', '49', 'Please cut out whole piece from background on separate layers.', NULL, NULL, NULL, '2021-07-17 23:01:37', 1),
(532, '23', '07-17-21-DRP-Pt-2', '67', '', 'Photoshop ( *PSD )', '15 hrs - Price will be double', '16', 'Please cut out whole piece from background and place on separate layers.', NULL, NULL, NULL, '2021-07-18 01:44:28', 1),
(533, '93', 'foot massager', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '2', 'clip out leg and product from background, clip out product', '$1.00', 'Waiting for process', 'Due', '2021-07-19 03:31:34', 1),
(534, '23', '07-19-21-DRP-Pt-2', '67', '', 'Photoshop ( *PSD )', '30 hrs', '28', 'Please cut out whole piece from background and place on separate layers.', NULL, NULL, NULL, '2021-07-19 15:18:21', 0),
(535, '5', '2021-07-21 RFG', '67', '', 'Photoshop ( *PSD )', '5 days', '11', 'Please have 2 layers â€” cutout of the jewelry, separate cutout for gemstones', NULL, NULL, NULL, '2021-07-21 19:55:42', 0),
(536, '55', 'Charlton x 4', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '4', 'Clipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', NULL, NULL, NULL, '2021-07-22 11:48:45', 0),
(537, '55', 'liverpool 3', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '3', 'Clipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', NULL, NULL, NULL, '2021-07-22 13:10:40', 0),
(538, '51', 'LT', '68', '', 'Photoshop ( *PSD )', '30 hrs', '12', 'Good clean masks around the product, masking out the product. Return as layered psd files. ', NULL, NULL, NULL, '2021-07-22 20:56:24', 0),
(539, '51', 'TF', '68', '', 'Photoshop ( *PSD )', '30 hrs', '10', 'Good clean masks around product, returning layered psd files', NULL, NULL, NULL, '2021-07-22 22:05:04', 0),
(540, '51', 'TF', '68', '', 'Photoshop ( *PSD )', '30 hrs', '10', 'Good clean masks around product, returning layered psd files', NULL, NULL, NULL, '2021-07-22 22:06:04', 0),
(541, '51', 'TF-Grapes/Nuts Bags', '68', '', 'Photoshop ( *PSD )', '30 hrs', '4', 'Good, clean masks around bags. Return as layered psd files.', NULL, NULL, NULL, '2021-07-22 22:40:21', 0),
(542, '55', 'U18 x 2', '67', '', 'JPEG ( *JPG; *JPEG; *JPE; *php )', '30 hrs', '2', 'Clipping path around main footballer and ball. Paths need to be as accurate as possible. Please return as jpeg on original background.\n$0.50 per image', NULL, NULL, NULL, '2021-07-23 15:16:04', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_info`
--

CREATE TABLE `tbl_user_info` (
  `id` int(11) NOT NULL,
  `fld_fullname` varchar(200) NOT NULL,
  `fld_email` varchar(100) NOT NULL,
  `fld_phone` varchar(50) NOT NULL,
  `fld_address` varchar(300) NOT NULL,
  `fld_country` varchar(50) NOT NULL,
  `fld_website` varchar(200) NOT NULL,
  `fld_password` text NOT NULL,
  `fld_source` varchar(200) NOT NULL,
  `fld_ipaddress` varchar(50) NOT NULL,
  `fld_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_info`
--

INSERT INTO `tbl_user_info` (`id`, `fld_fullname`, `fld_email`, `fld_phone`, `fld_address`, `fld_country`, `fld_website`, `fld_password`, `fld_source`, `fld_ipaddress`, `fld_datetime`) VALUES
(1, 'Katrin Esche', 'info@galgo-store.de', '', 'Haydnstrasse 4 06667 Weissenfels GERMANY', 'Germany', 'www.galgo-store.de', '36eb455614c49cf8fed292aacee673e92a43c38b', '', '185.93.230.9', '2020-03-19 10:44:36'),
(2, 'Matt Davis', 'matt@feedthedemand.com', '', '', 'United States', '', 'ad76ef1f98f6f3ae293fd580214992abb36a4341', 'Google', '192.88.134.9', '2020-03-19 16:03:58'),
(3, 'Natalie Moffett', 'nmoffett@porchlightatl.com', '', '', 'United States', '', '497cb2cf137ca0c8a0945d47700f3dc3de1e1537', 'Recomandation', '185.93.229.9', '2020-03-20 13:10:57'),
(4, 'Thea Volk', 'hello@theavolk.com', '', '', 'United States', '', 'ca84bbddc13ddf45fd431956fee02cb497515791', 'Recomandation', '192.88.135.9', '2020-03-20 17:13:12'),
(5, 'Beladora', 'sales@beladora.com', '', '', 'United States', '', '327fc6a352eb6b38c7e425e957e8dfcb694b66fd', '', '192.88.134.9', '2020-03-20 17:33:08'),
(6, 'David Dempsey', 'daviddesign@eircom.net', '', '', 'Ireland', '', 'ce907d0b9e77d08f419dda704031c7f57c223b98', 'Recomandation', '185.93.228.9', '2020-03-24 13:12:02'),
(7, 'Digitec Galaxus AG', 'design@digitecgalaxus.ch', '', '', 'Switzerland', '', 'f707db341d5a59624c57d7fc834b0cdea7c8ad10', 'Google', '185.93.230.9', '2020-03-25 06:27:19'),
(8, 'Ian McCausland', 'talk@ian.mb.ca', '', '', 'Canada', '', 'd3b8ea675a66debe1a47246bb1cc2d4c63cd1cdf', '', '66.248.200.9', '2020-03-25 18:28:37'),
(9, 'Travis de Clifford', 'travisdeclifford@gmail.com', '', '', 'Australia', '', '86fa2afdc9f2ec2c577e007e6eeead37d6fe4e1c', 'Recomandation', '66.248.202.9', '2020-03-27 00:43:01'),
(11, 'Amelia de Jong', 'amelia.acesnaps@gmail.com', '', '', 'United Kingdom', '', '1d69e8ec31b32b8b5ccf025623f2bf1698284426', '', '185.93.228.9', '2020-04-02 19:00:29'),
(12, 'Melinda Silber', 'melinda@designandenhance.com', '', '', 'United States', '', '6ccfc12c223ffff16066e4937ab29ad075132df0', '', '192.88.135.9', '2020-04-02 21:19:59'),
(14, 'Megan Trujillo', 'megan.trujillo@allencompany.net', '', '', 'United States', '', '41845f3ec8573165d3a5797d8fd68bcfe831d66f', 'Google', '192.88.135.9', '2020-04-15 21:38:52'),
(15, 'Patrick Dowd', 'motosales14@gmail.com', '', '', 'United States', '', '740247e183e6540e5ccce3976eef1a23dbb702aa', 'Recomandation', '192.88.134.9', '2020-04-18 15:58:48'),
(16, 'limor ifargan', 'limor.ifargan@gmail.com', '', '', 'Israel', '', '464a343afb300b3b817a9266f8cad9179260840f', '', '185.93.230.9', '2020-04-21 16:31:45'),
(17, 'RAPHAEL NAGLI', 'rafi@nagli.net', '', '', 'United States', '', '384f5551013418a06e022301fd53c83f985017df', '', '185.93.228.9', '2020-04-22 03:17:56'),
(18, 'robert pinto', 'robert11@yopmail.com', '', '', 'Afghanistan', '', 'b7efb0f4e7a2c81aeb064fa2b09509b3a973abdb', 'Google', '185.93.228.9', '2020-04-25 15:23:13'),
(21, 'David Segal', 'd.segal@raeburndesign.co.uk', '', '', 'United Kingdom', '', 'b30201b284e37f4c18b841b7f6df23b01a2a99a0', 'Recomandation', '185.93.228.9', '2020-04-28 16:37:35'),
(22, 'Joyce Caboor', 'contact@joycecaboor.com', '+316 27 55 56 64', 'Oudestad 8\r\n4501 JB Oostburg, Netherlands', 'Netherlands', 'https://www.joycecaboor.com', '90a65df5332efb3c55cad88256191fdbffbcbf37', 'Google', '66.248.202.9', '2020-05-01 10:55:10'),
(23, 'David Ross', 'amplifiedgd@mac.com', '', '', 'United States', '', '4f69e81bb1e01e63398949e49352344e7878a106', 'Google', '192.88.134.9', '2020-05-04 03:13:14'),
(24, 'Bo West', 'boseon1@me.com', '561.573.5819', '3701 SE Sea Point Ct., Stuart FL 34997', 'United States', '', '6f1a89a98cf4897d6edf34a563c37bbe04565ebe', '', '66.248.201.9', '2020-05-10 19:11:00'),
(25, 'Ian McCausland', 'talk@Ian.ca', '', '', 'Canada', '', '534b27b8d55ab668780f09caadfdbfc2f262893c', 'Recomandation', '66.248.200.9', '2020-05-21 17:02:51'),
(26, 'Francesco Migliorato', 'f.migliorato@protonmail.com', '', '', 'Italy', '', 'f7012d90a0d4fc6abe0f3ab5cead3f7a8c94f280', 'Social Site', '185.93.230.9', '2020-05-21 21:44:46'),
(27, 'Tiny Closet', 'tinycloset@hotmail.com', '', '', 'Oman', '', 'a7d2e6519a9befac5ea87d5a0728b6a4a8964caa', 'Google', '66.248.202.9', '2020-05-24 15:25:53'),
(28, 'Maria Hoysted', 'maria@shannonbridgepottery.com', '', '', 'Ireland', '', 'b57eb30f048f5fe6af9112473a72e1002641adef', 'Google', '185.93.228.9', '2020-05-27 10:40:51'),
(29, 'Olga Matjusina', 'happyolga12@gmail.com', '9123089648', '7126 collins ave', 'United States', '', '89283fe1f229fa6ba4114c01b1f9d8dfec09b1f9', 'Recomandation', '66.248.201.9', '2020-06-03 04:19:33'),
(30, 'allan', 'acollinge@furniturecourt.com.au', '', '', 'Australia', '', '8670e1b45c125fe9dc14e1ab56a4fe6d0d99a24d', 'Recomandation', '185.93.231.9', '2020-06-04 03:18:45'),
(32, 'Edith Faggen', 'vegasneworleans@hotmail.com', '', '', 'United States', '', 'c8c854c6fb6196efd765471044a7987d220cecdd', 'Google', '192.88.135.9', '2020-06-10 22:10:42'),
(34, 'Alessandro Neri', 'anerix@gmail.com', '', '', 'Italy', '', 'f641f2c6b1466aad9d3f5cdeaf83071356d7710d', 'Google', '185.93.230.9', '2020-06-16 06:25:53'),
(35, 'David Dempsey', 'daviddempseyphotography@gmail.com', '', '', 'Ireland', '', 'd13b9d484e76f49901a9756a3dcb2b43e79843aa', 'E-mail', '185.93.228.9', '2020-06-19 11:09:02'),
(36, 'Sandi Campbell', 'info@fablephotoandvideo.com', '', '', 'United States', '', '74530a6d16988d21c50672a71ab8ce6fa969bc2a', 'Google', '192.88.134.9', '2020-07-02 17:16:43'),
(38, 'lenworth Bowers ', 'lenworth1998@gmail.com', '', '', 'United Kingdom', '', 'f0a0966187728db7d7de05c5e713ad0c7221b057', 'Social Site', '185.93.228.9', '2020-07-10 18:02:52'),
(39, 'Paul Heisen', 'paul.heisen@vbr-turbinepartners.com', '', '', 'Netherlands', '', 'a2cee6b897dd4983986423cb4c7a08e65138dae3', '', '66.248.203.9', '2020-07-12 10:53:00'),
(40, 'Myah McNeill', 'myah@vida-design.com', '', '', 'United States', '', '094ae195f534c8653ec227248decf441d951e496', 'Recomandation', '192.88.134.9', '2020-07-13 17:21:54'),
(41, 'lori watson', 'lozzawatson@gmail.com', '', '', 'Australia', '', 'fb7d56720e4a52f70992cc655f5bae184f2e55af', 'Google', '192.88.134.9', '2020-07-24 02:18:05'),
(42, 'Jack wilam ', 'nayemhossain4959@gmail.com', '', '', 'United States', '', 'a1e675830d83c2e63360f3389bf164b29d981114', 'Google', '66.248.202.9', '2020-07-27 18:06:01'),
(43, 'Gemma Lockwood', 'gemlockwood@hotmail.co.uk', '', '', 'United Kingdom', '', 'd82789575b680c160d6861083f479730d79e96ac', 'Recomandation', '185.93.228.9', '2020-08-03 06:52:22'),
(44, 'Ruggiero', 'info@ruggierorusso.com', '', '', 'Italy', '', '5a726452012ceaf3f18ba698032acd0faaca0b20', 'E-mail', '185.93.230.9', '2020-08-06 15:58:50'),
(45, 'Adriana Falcon', 'adriana@commonthreadco.com', '', '', 'United States', '', 'fae49cf7c1b154cf7574f9c77f9485432bae47aa', 'Recomandation', '192.88.134.9', '2020-08-25 17:41:54'),
(46, 'Daniel Pattullo', 'dpattullo@gmail.com', '802-524-3699', '', 'United States', 'vtframeshop.com', '7f512e3ceea14faa7853fee811d4762594e02ed7', 'Google', '185.93.229.9', '2020-08-25 17:59:02'),
(48, 'Jillian Riedel', 'jillriedel44@gmail.com', '', '', 'United States', '', '0f4a8486417da4fe5d9a5a78731b63066d0f3239', 'Google', '192.88.134.9', '2020-09-04 18:49:32'),
(49, 'Edward Phillips', 'edwardphillips798@gmail.com', '', '', 'United States', '', 'ac8d304d89f16261f2f063a5037edcac02b5934e', 'Google', '66.248.202.9', '2020-09-12 15:45:15'),
(51, 'Gordon Lazzarone', 'gordon@lazzaronephotography.com', '(916) 213-3301', '2998 Franklin Blvd., Sacramento, CA 95818', 'United States', 'lazzaronephotography.com', '58a3a6afb460f53e18f8af4e80581e5a0af839fb', 'Google', '192.88.134.9', '2020-09-18 19:33:38'),
(54, 'Second and Charles, Inc.', 'brockettr@2ndandcharles.com', '', '', 'United States', '', '02a950ac294a63a3ef45aac9460e2b0d7d68d109', 'Recomandation', '185.93.229.9', '2020-09-28 20:40:11'),
(55, 'louise hutchinson', 'louise@twocan.co.uk', '', '', 'United Kingdom', '', '36adb8db09b0dd7c7594d154619c46e35103be73', 'Google', '185.93.228.9', '2020-09-29 19:33:35'),
(57, 'Alexander Roglin', 'a.roglin@drum-tec.de', '', '', 'Germany', '', 'fdf146e53b58ff3423d355632d266c80f99d3dfc', 'Google', '185.93.230.9', '2020-10-01 09:01:24'),
(58, 'Glenn', 'glenn@beetee.co.uk', '', '', 'United Kingdom', '', '4e6eb49dc15f0364018f8ed3cbbdd9f2022174ad', 'Google', '185.93.228.9', '2020-10-01 13:03:10'),
(60, 'Jeffrey Myers', 'Jeff@jeffmyersphotography.com', '7138067158', '11406 7th St. Santa Fe, TX 77510', 'United States', 'www.jeffmyersphotography.com', 'ce498b9f717763af26b09eada53fb6247eeab8bd', 'Google', '192.88.135.9', '2020-10-03 15:30:47'),
(61, 'Tobias Ogden', 'info@theogdenstudio.com', '7608451983', 'Carlsbad, CA 920', 'United States', 'www.theogdenstudio.com', '4f6910dd8f173bdc2c808e76f58a02287e54750c', '', '192.88.134.9', '2020-10-03 16:44:21'),
(62, 'Brent Vickers', 'contact@brcksmedia.com', '', '', 'Australia', '', '9fd8236e34285219a8158b7ffc9a5a8534e4b514', 'Google', '66.248.202.9', '2020-10-07 09:04:10'),
(64, 'Sezan Mahmud', 'bdsezan007@hotmail.com.com', '+8801711442709', '558 North Ibrahimpur, Dhaka', 'Australia', 'www.kmsgroupaustralia.com', 'b5210def4514c6799f67834a27eae1603fcfde89', 'Recomandation', '66.248.202.9', '2020-10-09 18:09:26'),
(65, 'Bobby Mottola', 'bobby@academyhospitality.ca', '2048018404', '242 Hargrave Street\r\nWinnipeg, Manitoba Canada\r\nR3C0M8', 'Canada', 'www.mottolagrocery.com', 'eedfdbc8646a90880719a8b7a65ecae91fb2f421', 'Recomandation', '66.248.200.9', '2020-11-03 04:20:59'),
(66, 'Diogo Duarte', 'contact@diogo-duarte.com', '', '', 'United Kingdom', '', '604ffe0ce51a370f9c82446adb63a6e961477441', 'Google', '185.93.228.9', '2020-11-05 09:57:13'),
(68, 'Adaptive Manufacturing Pty', 'workshop@adaptivemanufacturing.com.au', '0408843993', 'Unit 2 2-4 Byre Ave, Somerton Park. South Australia 5044', 'Australia', 'www.adaptivemanufacturing.com.au', '10488174ef853ff9af3288c859979b60cea53525', 'Google', '192.88.134.9', '2020-11-11 00:53:24'),
(69, 'Ali Monib', 'Alimonib@gmail.com', '', '', 'Egypt', '', '4f301662642485e268802c7d585b6419d20a2e75', 'Google', '185.93.228.9', '2020-11-12 20:55:03'),
(71, 'vicens gimenez', 'info@vicensgimenez.com', '', '', 'Spain', '', 'fcf0555085215202848663f354634a9c231d8eef', 'Recomandation', '185.93.228.9', '2020-11-18 17:53:45'),
(72, 'SHAJI CHERIAN', 'shajicherian@gmail.com', '', '', 'Australia', '', '936f9822308e9419b5c53512068c2d851de3bfeb', 'Google', '192.88.134.9', '2020-11-28 23:57:19'),
(73, 'Dennis Stratmann', 'ds@pixel44.de', '', '', 'Germany', '', '0676e96a90ad67a9c0dc028cc95a3e79f82fd4f8', 'Recomandation', '66.248.203.9', '2020-12-01 12:32:25'),
(74, 'john', 'nelander.john@gmail.com', '', '', 'Sweden', '', 'a7c2c34e051ba5b4b2aba950cd922273a013d173', 'Recomandation', '66.248.203.9', '2020-12-07 12:51:52'),
(75, 'Robin Reynolds', 'reynoldsimaging@gmail.com', '', '', 'United States', '', '58751b5cecee4f1deadc594470948bd17780db09', 'Google', '185.93.229.9', '2020-12-10 02:22:11'),
(77, 'Sezan Mahmud', 'bdsezan007@hotmail.com', '+019724896078', '584 Ibrahimpur', 'Australia', 'www.clippingpathhouse.com', 'b5210def4514c6799f67834a27eae1603fcfde89', 'Recomandation', '66.248.202.9', '2020-12-19 06:11:25'),
(78, 'Arend Van Der Salm', 'info@arendvandersalm.nl', '06-23800939', 'K.v.k: 55334636\r\nBtw no: NL00157287', 'Netherlands', 'www.arendvandersalm.nl', '36a0a3a524b053faf470a22ef4a506a6891416d1', 'Google', '66.248.202.9', '2020-12-19 06:18:01'),
(79, 'Ivo van Leeuwen', 'info@ivovleeuwen.nl', '', '', 'Netherlands', '', '079a181f4452aa585a461d45420b208f927f0ba8', 'Recomandation', '66.248.203.9', '2020-12-20 23:23:21'),
(80, 'Eduardo Medrano', 'ed.jr.medrano@gmail.com', '', '', 'United States', '', '727b3cd585db10794db08f59cf858b2ba59a1d73', 'Google', '192.88.134.9', '2020-12-27 05:26:57'),
(81, 'Nilsson Gonsalves', 'nilsson@culturerising.ca', '', '', 'Canada', '', '0252fb0b0e3c9ecd9acac2b2bfdc4ecbdd634dc6', 'Google', '66.248.200.9', '2020-12-31 03:27:53'),
(82, 'Majd naem', 'Majdaljalous@gmail.com', '', '', 'Jordan', '', '396115a056838bcdc74e6d4a6b5493118ef94abf', 'Google', '185.93.230.9', '2021-01-04 14:48:30'),
(84, 'Brent Lehman', 'graphics@copyquik.com', '', '', 'United States', '', 'b66eed0ae04a15030c2c39a76d8eafb241a7c667', 'Google', '185.93.229.9', '2021-01-06 18:02:03'),
(86, 'Victor Tesfamichael', 'tesfamichaelv@yahoo.com', '', '', 'United States', '', '46721a5c1bd19f2c21d9f737602ffeb8540015a3', 'Yahoo', '192.88.134.9', '2021-01-19 20:15:54'),
(88, 'Jason Bleecher', 'jason@jasonbleecher.com', '', '', 'United States', '', '287fe5a318ad06d710e54c000f2395df55e9dcfb', 'Google', '192.88.135.9', '2021-01-27 19:04:59'),
(91, 'Florian Boehm', 'fb@akfb.com', '', '', 'Germany', '', 'f5362dce17c449b25d3391f8ad9892d9e1fefdfa', 'Google', '185.93.230.9', '2021-02-03 09:54:51'),
(92, 'Donald Vovore', 'donvovore@gmail.com', '', '', 'Paraguay', '', '97660a766a5ebd32086656fc5141d6e34db57b22', 'Social Site', '66.248.202.9', '2021-02-04 06:22:01'),
(93, 'Ken von Kriegenbergh', 'kbvk1962@gmail.com', '9093447887', '57872 Barristo Cir La Quinta Ca 92253', 'United States', 'kbvk1962@gmail.com', '247c07075794dd3a1899fc01efc6ca1b898b3db3', 'Google', '192.88.134.9', '2021-02-05 04:40:45'),
(95, 'Tesfit Eman', 'tesaddis2017@gmail.com', '', '', 'United States', '', 'e922126e11af7a1ce1af727bd6e790f3d26ef73e', '', '185.93.229.9', '2021-02-09 01:51:51'),
(96, 'Martin Kaufmann', 'martin@martinkaufmann.dk', '', '', 'Denmark', '', 'e258900736b812481802062310850293b2912e60', 'E-mail', '66.248.203.9', '2021-02-09 14:49:01'),
(99, 'Maria Hoysted', 'info@shannonbridgepottery.com', '', '', 'Ireland', '', '2835a3f92ee33ff87eaf38e7269e133c393fae4d', '', '185.93.228.9', '2021-02-16 21:22:48'),
(100, 'Ryan Chamberlin', 'ryanlamedia@gmail.com', '', '', 'United States', '', 'c057ff863c4472ea6da4cc1840e3a6942743e867', 'Recomandation', '192.88.134.9', '2021-02-23 04:24:38'),
(102, 'Mikel Darling', 'mike@stylewerks.photo', '+1 310 985 0503', '2289 W. 25th St., Los Angeles, CA 90018', 'United States', 'mikeldarling.com', 'ce7c574de06ca988371cdab840627b01a0112e5b', 'Google', '192.88.134.9', '2021-03-11 08:38:31'),
(103, 'xavier butcher', 'zeedeeh@gmail.com', '', '', 'Denmark', '', '55aad7fb299809e7337334450a10c194dc1845aa', 'Google', '66.248.203.9', '2021-03-15 08:25:48'),
(104, 'Kelsey', 'kelsey@kitchencollaborative.com', '', '', 'United States', '', '050ee95a1400457dcedc274a03576df81742df14', 'Google', '192.88.134.9', '2021-03-15 23:14:40'),
(106, 'David Lipnowski', 'davidlipnowski@gmail.com', '', '', 'Canada', '', '99bd5fc8aef465cb481d68bc08be2c2882b33a92', 'Recomandation', '66.248.200.9', '2021-03-23 01:13:23'),
(107, 'Fotografene Lillian & Lena DA', 'lillian@elel.no', '', 'Sofienberggata 57, 0563 Oslo', 'Norway', '', '53a4560e67fd27e4e530d0bfc41c7e879a9b6312', 'E-mail', '66.248.203.9', '2021-03-24 13:26:24'),
(108, 'Elencolux AB', 'info@elencolux.se', '', '', 'Sweden', '', 'ead7ff088a33647b388a53978d67301336a775c5', 'Yahoo', '66.248.203.9', '2021-03-25 15:57:41'),
(109, 'vicens gimenez', 'hola@vicensgimenez.com', '', '', 'Spain', '', 'ad1ebe765c57bba39adc45b9311a91744df5a5a1', 'Recomandation', '185.93.228.9', '2021-03-30 18:02:56'),
(110, 'Tobias Sagmeister Photography', 'tobiassagmeister@icloud.com', '', '', 'Germany', '', 'aacd8bfe593b06bcfa9006cf3c275d5f134f1e12', 'Google', '185.93.230.9', '2021-04-03 18:12:49'),
(111, 'Rusty B', 'info@russellbarton.com.au', '', '', 'Australia', '', 'd9afcad0e59e8491d007235653a2d1db2575a640', '', '192.88.134.9', '2021-04-04 04:15:43'),
(114, 'Tainara Lima dos santos', 'tainaralima1213@gmail.com', '', '', 'Brasil', '', 'b7ce13ffb648c69b3bae03519511cc6fbb47575b', 'RecomandaÃ§Ã£o', '66.248.201.9', '2021-04-10 20:05:17'),
(115, 'jon', 'jonabraham@gmail.com', '', '', 'Estonia', '', 'dff5e2ff61844d59e67f3dc277301e6f37b519d6', 'Google', '185.93.231.9', '2021-04-15 09:58:49'),
(116, 'Anne Troxel', 'anne@anne-troxel.com', '', '', 'United States', '', 'b57eb30f048f5fe6af9112473a72e1002641adef', 'Google', '185.93.229.9', '2021-05-05 03:16:03'),
(117, 'Emiliano A Cabrera', 'emilianojaque@gmail.com', '', '', 'Argentina', '', 'b59db7b54add1daf0599994dc3cfb8bb2c32e266', 'Google', '66.248.201.9', '2021-05-10 14:39:46'),
(118, 'Ellen Brown', 'ellen@ellebellenyc.com', '', '', 'United States', '', 'a2c8dcc6d64e00a8382c3480dac91dce96335e56', 'E-mail', '192.88.134.9', '2021-06-02 03:36:14'),
(119, 'Ellen R Brown', 'ellebellestyle@gmail.com', '', '', 'United States', '', 'a2c8dcc6d64e00a8382c3480dac91dce96335e56', '', '192.88.134.9', '2021-06-02 03:51:06'),
(121, 'David Katz', 'davidkatzphotography@gmail.com', '', '', 'United States', '', '36a571a1452d28bb6f9922c6e87af302ea81ff26', 'Social Site', '185.93.229.9', '2021-06-02 18:12:41'),
(124, 'Raina Jones', 'rainaj6@gmail.com', '', '', 'United States', '', '5ef2afd166726eb5cc7bb8dce13b51a17e9a5137', 'Social Site', '66.248.200.9', '2021-07-11 20:08:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_account_info`
--
ALTER TABLE `tbl_account_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_additional_services`
--
ALTER TABLE `tbl_additional_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_admin_user`
--
ALTER TABLE `tbl_admin_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_captcha`
--
ALTER TABLE `tbl_captcha`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_delivery_time`
--
ALTER TABLE `tbl_delivery_time`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_file_format`
--
ALTER TABLE `tbl_file_format`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_free_quote`
--
ALTER TABLE `tbl_free_quote`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_free_trial`
--
ALTER TABLE `tbl_free_trial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_main_services`
--
ALTER TABLE `tbl_main_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_pass`
--
ALTER TABLE `tbl_pass`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_quick_query`
--
ALTER TABLE `tbl_quick_query`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_register_job`
--
ALTER TABLE `tbl_register_job`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user_info`
--
ALTER TABLE `tbl_user_info`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_account_info`
--
ALTER TABLE `tbl_account_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_additional_services`
--
ALTER TABLE `tbl_additional_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_admin_user`
--
ALTER TABLE `tbl_admin_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_captcha`
--
ALTER TABLE `tbl_captcha`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tbl_delivery_time`
--
ALTER TABLE `tbl_delivery_time`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_file_format`
--
ALTER TABLE `tbl_file_format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_free_quote`
--
ALTER TABLE `tbl_free_quote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `tbl_free_trial`
--
ALTER TABLE `tbl_free_trial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `tbl_main_services`
--
ALTER TABLE `tbl_main_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `tbl_pass`
--
ALTER TABLE `tbl_pass`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_quick_query`
--
ALTER TABLE `tbl_quick_query`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tbl_register_job`
--
ALTER TABLE `tbl_register_job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=543;

--
-- AUTO_INCREMENT for table `tbl_user_info`
--
ALTER TABLE `tbl_user_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
