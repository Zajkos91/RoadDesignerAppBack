-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 09 Lis 2023, 22:09
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `drogowiec_roads`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `loginpass`
--

CREATE TABLE `loginpass` (
  `id` int(10) NOT NULL,
  `login` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `loginpass`
--

INSERT INTO `loginpass` (`id`, `login`, `password`) VALUES
(1, 'admin', '$2a$10$.7gf01eymOCkg8WbqXIMb.Qq3iesIfayUMt.K.zVnxWGp5uNML.1e');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `roads`
--

CREATE TABLE `roads` (
  `id` varchar(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `realisationYear` int(4) NOT NULL,
  `url` varchar(100) NOT NULL,
  `startLat` decimal(10,7) NOT NULL,
  `startLon` decimal(10,7) NOT NULL,
  `endLat` decimal(10,7) NOT NULL,
  `endLon` decimal(10,7) NOT NULL,
  `startAddress` varchar(100) NOT NULL,
  `endAddress` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `roads`
--

INSERT INTO `roads` (`id`, `name`, `description`, `realisationYear`, `url`, `startLat`, `startLon`, `endLat`, `endLon`, `startAddress`, `endAddress`) VALUES
('0dca788d-a3df-4b9c-9f7d-934d2bd62039', 'Dolna w m. Klepacze', 'Budowa drogi gminnej w m. Klepacze - 0,7 km', 2018, 'https://maps.app.goo.gl/ThLM1DU4asb5KYkq5', '53.1181851', '23.0762657', '53.1162492', '23.0722032', 'Dolna 2 Klepacze', 'Dolna 25 Klepacze'),
('1afe67e1-d505-4524-a4ef-3af776220330', 'DG010KZ Wysokie Mazowieckie', 'Budowa drogi gminnej od ul. 1 Maja do ul. Szpitalnej  - długość 1,1 km', 2017, 'https://maps.app.goo.gl/2L1UiZnKaK1TCHdC8', '52.9090631', '22.5113337', '52.9133831', '22.5265112', '1 Maja 24, Wysokie Mazowieckie', 'Prusa 37, Wysokie Mazowieckie'),
('2f03d1ca-de38-462f-8c4e-2ce04a69e96a', 'DP2992W Chmielewo - Garwolewo', 'Rozbudowa drogi powiatowej w gm. Czerwińsk Nad Wisłą - 3,3 km', 2022, 'https://maps.app.goo.gl/aqzNjCamj5gRYtNX6', '52.4103631', '20.2319402', '52.4379535', '20.2700958', 'Bolino', 'Garwolewo, Czerwińsk nad Wisłą'),
('396a0619-c79a-4071-9c87-ade92195254e', 'DP2544B Baranowo Wyszel', 'Rozbudowa drogi powiatowej w gm. Baranowo', 2021, 'https://maps.app.goo.gl/aHdeQ3zqMXqErZSC8', '53.1733347', '21.3060317', '53.1522222', '21.3509571', 'Słoneczna 97, Baranowo', 'Zimna Woda, Baranowo'),
('565e65f4-1a8e-4ea8-9c72-fdcb6dbed7b4', 'DP1483B Wólka-Biele', 'Rozbudowa drogi powiatowej w zakresie budowy ścieżki rowerowej - długość 2,1 km', 2016, 'https://maps.app.goo.gl/8qeCwYibq75wQiCbA', '52.9993527', '23.1563359', '52.9823102', '23.1475557', 'Wólka, Podlaskie', 'Biele, Podlaskie'),
('5c649a1c-bef8-41e5-925a-9cc0498f1c58', 'Cicha i Łąkowa w Czarnej Białostockiej', 'Przebudowa ulic w Czarnej Białostockiej - 0,9 km', 2017, 'https://maps.app.goo.gl/H8zUV1mJizSBVw817', '53.3024373', '23.2878386', '53.3043666', '23.2879659', 'Marszałka Piłsudskiego 43, Czarna Białostocka', 'Cicha 3, Czarna Białostocka'),
('5cb85d9d-d1b3-4d4b-a893-baaa3b8e5989', 'DP1456B Bobrowniki - Mostowlany', 'Rozbudowa drogi powiatowej w gm. Gródek przy granicy z Białorusią - 8 km', 2023, 'https://maps.app.goo.gl/DMysRMNG95a2SxgV6', '53.1226152', '23.8877307', '53.0678001', '23.8781156', 'Bobrowniki, Gródek', 'Mostowlany, Gródek'),
('696ce0ee-51e1-48f0-92ac-999da29bdc02', 'DP1479B Koplany - Stacja Lewickie', 'Rozbudowa drogi powiatowej w gm. Juchnowiec Kościelny - 4 km', 2023, 'https://maps.app.goo.gl/XhL9yNy7fXTE7ZJL7', '53.0601992', '23.0947396', '53.0313859', '23.1234901', 'Kolonia Koplany 11D, Juchnowiec Kościelny', 'Lewickie-Stacja 25, Juchnowiec Kościelny'),
('85cd4bad-d4fb-4c5d-864f-615ea90ae2f6', 'DP2391B ul. Nowa, Supraśl', 'Przebudowa drogi powiatowej od ul. Białostockiej do ul. Dolnej - 0,3 km', 2017, 'https://maps.app.goo.gl/9AS1M4v4BYbpfg1s8', '53.2061607', '23.3278665', '53.2058863', '23.3282485', 'Nowa 45, Supraśl', 'Nowa 12, Supraśl'),
('93267041-beeb-40cd-b637-4c1f77ef0abe', 'Kolonia Dojlidy i Wigierska w Białymstoku', 'Przebudowa ulic na osiedlu Dojlidy w Białymstoku - 1,5 km', 2017, 'https://maps.app.goo.gl/gwrzNrjwqceEocLZ9', '53.0889319', '23.2253712', '53.0887103', '23.2299682', 'Milowa 33, Białystok', 'Wigierska 2A, Białystok'),
('a336c35b-f006-4a66-84a6-7b907dd2300f', 'DP2081B Rosochate - Dąbrowa', 'Przebudowa drogi powiatowej, gm. Czyżew - 3,6 km', 2019, 'https://maps.app.goo.gl/LBzZ8vfXB1zmQdT76', '52.8610422', '22.3518389', '52.8463203', '22.4056957', 'Kościelna 2, 18-220 Rosochate Kościelne', 'Dąbrowa Wielka, Czyżew'),
('ac1d1b6c-cf1d-4f7f-b0f0-c5652c6f535b', 'Świerkowa, Gajowa i Klonowa w m. Krupniki', 'Budowa dróg gminnych w Krupnikach - 1,4 km', 2018, 'https://maps.app.goo.gl/Tfe9csxwB6PVeEUr5', '53.1326000', '23.0539800', '53.1346460', '23.0745616', 'Lipowa 23, 16-070 Krupniki', 'Elewatorska 11/1, 16-070 Białystok'),
('bafe44a2-5879-4551-8481-7b6321d337d9', 'DW743 Góra Puławska', 'Rozbudowa drogi wojewódzkie w m. Góra Puławska - 1 km', 2023, 'https://maps.app.goo.gl/CVkAnkFs8V6PvLC28', '51.4101519', '21.9339541', '51.4032589', '21.9353284', 'Radomska 17, 24-100 Góra Puławska', 'Janowiecka 57, 24-100 Góra Puławska'),
('d6c1a78f-1ad8-4f09-9106-feb3e3ece5da', 'DP2509W Czarnia - Cupel', 'Rozbudowa drogi powiatowej w gm. Czarnia', 2021, 'https://maps.app.goo.gl/aHdeQ3zqMXqErZSC8', '53.3650200', '21.2391100', '53.3499718', '21.1086957', 'Brzozowy Kąt, Czarnia', 'Cupel, Czarnia'),
('f14f11f3-f00f-48d8-a2eb-f24fd0d378bd', 'DP1484B Niewodnica Kudrycze', 'Rozbudowa drogi powiatowej na odcinku Niewodnica Nargilewska Kudrycze  - długość 4,0 km', 2017, 'https://maps.app.goo.gl/Cw69gCKXmPdeutCj8', '53.0598696', '23.2112025', '53.0317935', '23.2160221', 'Niewodnica Nargilewska 18A, Podlaskie', 'Kudrycze, Podlaskie'),
('f89d13fe-0b45-4d68-9525-b87c6652119f', 'Zawady w Białymstoku', 'Budowa ulicy na osiedlu Zawady w Białymstoku - 0,5 km', 2018, 'https://maps.app.goo.gl/xrhpH1fdZsEqzdss8', '53.1696823', '23.1111062', '53.1722359', '23.1085408', 'św. Krzysztofa 3, Białystok', 'Zawady 145, Białystok');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `loginpass`
--
ALTER TABLE `loginpass`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `roads`
--
ALTER TABLE `roads`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `loginpass`
--
ALTER TABLE `loginpass`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
