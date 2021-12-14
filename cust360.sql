-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2021 at 11:57 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cust360`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) UNSIGNED NOT NULL,
  `clientId` int(11) UNSIGNED NOT NULL,
  `type` enum('creditor','debitor','repay','clarification','clearing','clarification_avis') NOT NULL,
  `totalDebit` decimal(12,2) NOT NULL,
  `totalDebitDue` decimal(12,2) NOT NULL,
  `totalCredit` decimal(12,2) NOT NULL,
  `balance` decimal(12,2) NOT NULL,
  `dunningCheckedAt` datetime DEFAULT NULL,
  `exportedAt` datetime DEFAULT NULL,
  `externalId` varchar(12) DEFAULT NULL,
  `isPaymentBlocked` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `exportArchiveId` int(11) DEFAULT NULL COMMENT 'ID of export archive (active since 2018-01)',
  `reverseCharge` tinyint(1) NOT NULL DEFAULT 0,
  `modificationDate` datetime DEFAULT NULL COMMENT 'Änderungszeitpunkt'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `clientId`, `type`, `totalDebit`, `totalDebitDue`, `totalCredit`, `balance`, `dunningCheckedAt`, `exportedAt`, `externalId`, `isPaymentBlocked`, `exportArchiveId`, `reverseCharge`, `modificationDate`) VALUES
(1, 1, 'repay', '0.00', '0.00', '0.00', '0.00', NULL, NULL, NULL, 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

CREATE TABLE `contracts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `externalContractId` bigint(20) UNSIGNED DEFAULT NULL,
  `affiliatedCompanyId` int(11) UNSIGNED DEFAULT NULL,
  `reviewedAt` datetime DEFAULT NULL,
  `reviewedBy` int(11) UNSIGNED DEFAULT NULL,
  `reviewId` int(11) NOT NULL DEFAULT 1,
  `clientId` int(11) NOT NULL,
  `type` enum('energy','emobility','non_commodity','energy_external','water_sewage','feed_in','generic','tenant_electricity_object','bundle') NOT NULL,
  `isRlm` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `customerId` bigint(20) UNSIGNED NOT NULL,
  `authEnabled` tinyint(1) NOT NULL DEFAULT 0,
  `authUsername` varchar(255) DEFAULT NULL,
  `authHash` varchar(60) DEFAULT NULL,
  `authorizedAt` datetime DEFAULT NULL,
  `authorizationToken` varchar(64) DEFAULT NULL,
  `authorizationTokenCreatedAt` datetime DEFAULT NULL,
  `authorizationTokenUsedAt` datetime DEFAULT NULL,
  `authorizationTokenIp` int(11) UNSIGNED DEFAULT NULL,
  `passwordResetHash` varchar(64) DEFAULT NULL,
  `passwordResetGeneratedAt` datetime DEFAULT NULL,
  `orderId` bigint(20) UNSIGNED DEFAULT NULL,
  `accountId` int(11) UNSIGNED NOT NULL,
  `brandId` int(11) UNSIGNED DEFAULT NULL,
  `createdAt` datetime NOT NULL COMMENT 'Vertragsdatum',
  `orderedAt` datetime NOT NULL,
  `signatureDate` date DEFAULT NULL,
  `cancelledAt` datetime DEFAULT NULL,
  `minimumRuntimeDate` date DEFAULT NULL,
  `filingDateCancellation` date DEFAULT NULL,
  `cancelledBy` enum('agent','provider','system') DEFAULT NULL,
  `cancellationTechKey` varchar(255) DEFAULT NULL,
  `cancellationReason` varchar(255) DEFAULT NULL,
  `cancellationTriggeredDate` datetime DEFAULT NULL COMMENT 'date when cancellation was triggered',
  `revokedAt` datetime DEFAULT NULL,
  `fillingDateRevocation` datetime DEFAULT NULL,
  `business` tinyint(1) NOT NULL,
  `industry` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `salutation` int(2) NOT NULL,
  `firstname` varchar(70) DEFAULT NULL,
  `surname` varchar(70) DEFAULT NULL,
  `street` varchar(255) NOT NULL,
  `houseNumber` varchar(16) NOT NULL,
  `floor` varchar(255) DEFAULT NULL,
  `zip` int(5) UNSIGNED ZEROFILL NOT NULL,
  `city` varchar(128) NOT NULL,
  `cityExtended` varchar(128) DEFAULT NULL,
  `countryId` int(11) DEFAULT NULL,
  `billing_company` varchar(255) DEFAULT NULL,
  `billing_salutation` int(2) NOT NULL,
  `billing_title` varchar(255) DEFAULT NULL,
  `billing_firstname` varchar(70) DEFAULT NULL,
  `billing_surname` varchar(70) NOT NULL,
  `billing_street` varchar(255) NOT NULL,
  `billing_houseNumber` varchar(16) NOT NULL,
  `billing_phone` varchar(128) DEFAULT NULL,
  `billing_fax` varchar(128) NOT NULL,
  `billing_email` varchar(128) DEFAULT NULL,
  `billing_zip` varchar(16) NOT NULL,
  `billing_city` varchar(128) NOT NULL,
  `billing_countryId` int(11) UNSIGNED DEFAULT NULL,
  `billing_careOfRecipient` varchar(255) NOT NULL,
  `invoice_alternativeAddress` tinyint(4) NOT NULL DEFAULT 0,
  `invoice_company` varchar(255) NOT NULL,
  `invoice_salutation` int(2) NOT NULL,
  `invoice_firstname` varchar(70) NOT NULL,
  `invoice_surname` varchar(70) NOT NULL,
  `invoice_street` varchar(255) NOT NULL,
  `invoice_houseNumber` varchar(16) NOT NULL,
  `invoice_phone` varchar(128) NOT NULL,
  `invoice_fax` varchar(128) NOT NULL,
  `invoice_email` varchar(128) NOT NULL,
  `invoice_zip` int(5) UNSIGNED ZEROFILL NOT NULL,
  `invoice_city` varchar(70) NOT NULL,
  `invoice_countryId` int(11) UNSIGNED DEFAULT NULL,
  `invoice_careOfRecipient` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `fax` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `energy` enum('gas','electricity','water','water_sewage','non_energy','feed_in_direct','heat','precipitation_water') NOT NULL,
  `campaignId` int(11) NOT NULL,
  `instantBonusPayoutRequested` tinyint(1) NOT NULL DEFAULT 0,
  `instantBonusPayoutInvalidatedAt` datetime DEFAULT NULL,
  `instantBonusCreatedAt` datetime DEFAULT NULL,
  `instantBonusPaidOutAt` datetime DEFAULT NULL,
  `previousProviderId` int(11) DEFAULT NULL,
  `previousProductId` int(11) DEFAULT NULL,
  `previousVariant` int(11) DEFAULT NULL,
  `previousProvider` varchar(255) DEFAULT NULL,
  `previousProduct` varchar(255) DEFAULT NULL,
  `previousProviderCodeNumber` varchar(15) DEFAULT NULL,
  `previousProviderCodeNumberProvider` enum('none','bdew','iln','dvgw') DEFAULT NULL,
  `netCodeNumber` varchar(15) DEFAULT NULL,
  `netCodeNumberProvider` enum('none','bdew','iln','dvgw') DEFAULT NULL,
  `netNumber` int(4) DEFAULT NULL,
  `netSubNumber` int(6) DEFAULT NULL,
  `netAreaNumber` int(6) DEFAULT NULL,
  `overConsumptionWorkingPrice` float NOT NULL DEFAULT 0,
  `usage` int(11) NOT NULL,
  `usageNet` float DEFAULT NULL,
  `usagePrevious` float DEFAULT NULL,
  `desiredStartDate` date DEFAULT NULL,
  `desiredStartDateOverride` date DEFAULT NULL,
  `desiredInvoiceDate` date DEFAULT NULL,
  `desiredInvoiceReason` enum('relocation','customerRequest','individual','carrier') DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `nextPossibleCancellationByLfa` date DEFAULT NULL,
  `cancellationPreviousProviderSent` datetime DEFAULT NULL,
  `cancellationPreviousProviderStatus` enum('open','sent','positive','negative') NOT NULL DEFAULT 'open',
  `cancellationPreviousProviderProcess` varchar(35) DEFAULT NULL,
  `cancellationSucceedingProviderProcess` varchar(35) DEFAULT NULL,
  `netDeliveryStartSent` datetime DEFAULT NULL,
  `netDeliveryStartStatus` enum('open','sent','positive','negative') NOT NULL DEFAULT 'open',
  `netDeliveryStartProcess` varchar(35) DEFAULT NULL,
  `netDeliveryStartConfirmed` datetime DEFAULT NULL,
  `netDeliveryEndConfirmed` datetime DEFAULT NULL,
  `netDeliveryEndDate` date DEFAULT NULL,
  `cancellationPreviousProviderConfirmed` datetime DEFAULT NULL,
  `readingDate` varchar(15) DEFAULT NULL,
  `readingDateConfirmed` varchar(15) DEFAULT NULL,
  `customerNumber` varchar(50) DEFAULT NULL,
  `marketLocation` varchar(35) DEFAULT NULL COMMENT 'Marktlokation-Identifier während Wechselprozess',
  `meterLocation` varchar(35) DEFAULT NULL COMMENT 'Messlokation-Identifier während Wechselprozess',
  `meterPointIdentifier` varchar(45) DEFAULT NULL COMMENT 'Unique Identifier - water meter point',
  `obisCode` varchar(50) DEFAULT NULL,
  `isFlatRate` tinyint(1) NOT NULL DEFAULT 0,
  `counterNumber` varchar(70) DEFAULT NULL,
  `activeCounterId` int(11) DEFAULT NULL,
  `customerSpecification` enum('terminated_in_person','earliest_possible_date','relocation_at','desired_date','basic_supply_registration','relocation_without_mako','substitute_supply_registration','move_in') NOT NULL,
  `desiredDate` date DEFAULT NULL,
  `terminatedAt` date DEFAULT NULL,
  `relocationAt` date DEFAULT NULL,
  `basicSupplyAt` date DEFAULT NULL,
  `nextRegularExecutionAt` date DEFAULT NULL,
  `substituteSupplyAt` date DEFAULT NULL,
  `status` enum('open','blocked','active','waiting','cancelled','cancellation_previous','delivery_net','terminated','expired','done') DEFAULT NULL,
  `isLocked` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'if true (1), the entity is locked for editing',
  `privacyProtectionCheckedAt` date DEFAULT NULL,
  `legalCase` date DEFAULT NULL COMMENT 'Shows the date a contract gets into a legal case. For example, it prevents from being deleted.',
  `edifactStatus` varchar(15) DEFAULT NULL,
  `cityId` int(11) UNSIGNED DEFAULT NULL,
  `blocked` tinyint(1) NOT NULL DEFAULT 0,
  `disabled` tinyint(1) NOT NULL DEFAULT 0,
  `manualBillingBlocked` tinyint(4) NOT NULL DEFAULT 0,
  `manualBilling` tinyint(1) NOT NULL DEFAULT 0,
  `manualBillingCleared` tinyint(1) NOT NULL DEFAULT 0,
  `billingBlocked` tinyint(1) NOT NULL DEFAULT 0,
  `cancellationBlocked` varchar(10) DEFAULT NULL,
  `dunningLocked` tinyint(1) NOT NULL DEFAULT 0,
  `dunningLockedUntil` date DEFAULT NULL,
  `dunningLockReason` varchar(255) DEFAULT NULL,
  `counterExchange` tinyint(1) NOT NULL DEFAULT 0,
  `billable` tinyint(1) NOT NULL DEFAULT 0,
  `relocationProhibited` tinyint(4) NOT NULL DEFAULT 0,
  `customerReadingRequestedAt` datetime DEFAULT NULL,
  `winback` tinyint(1) NOT NULL DEFAULT 0,
  `lastWinback` datetime DEFAULT NULL,
  `energyTaxExemption` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `eegChargeExemption` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `accountingAllocationIndicator` enum('standard','standard_reverse_charge','nato','affiliated_with_tax','tax_group_affiliated','company_consolidated_with_tax','tax_group_company_consolidated','concern_consolidated_with_tax','tax_group_concern_consolidated','consolidated_proportionally_with_tax','tax_group_consolidated_proportionally','associated_with_tax','tax_group_associated','associated_without_payment') NOT NULL,
  `externalId` varchar(255) DEFAULT NULL,
  `regularInterval` enum('1','3','6','12') NOT NULL DEFAULT '12' COMMENT 'UTILMD Turnusintervall in Monaten',
  `groupAssignment` enum('Z15','Z18') DEFAULT NULL COMMENT 'UTILMD Gruppenzuordnung',
  `useRelationshipToGenerateInvoices` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'changes the generation of invoices',
  `suppressSentForInvoiceEvent` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `customerReadingLastInvoiceRequestedId` int(11) UNSIGNED DEFAULT NULL COMMENT 'last invoice id for the requested reading',
  `revalidateDuplicates` tinyint(4) NOT NULL DEFAULT 0,
  `lastRequestReadingInvoiceDate` date DEFAULT NULL COMMENT 'the invoice date for which the request reading cron has last send a request',
  `lastRequestReadingInvoiceDateCounter` tinyint(4) DEFAULT 0 COMMENT 'counts how many requests for one invoice date have been send',
  `complexSystem` tinyint(1) NOT NULL DEFAULT 0,
  `checkCompensationValue` tinyint(1) NOT NULL DEFAULT 0,
  `dunningProcedureId` int(11) DEFAULT NULL,
  `source` varchar(50) DEFAULT NULL COMMENT 'source of contract e.g. migration or migration api',
  `modificationDate` datetime DEFAULT NULL COMMENT 'Änderungszeitpunkt'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contracts`
--

INSERT INTO `contracts` (`id`, `externalContractId`, `affiliatedCompanyId`, `reviewedAt`, `reviewedBy`, `reviewId`, `clientId`, `type`, `isRlm`, `customerId`, `authEnabled`, `authUsername`, `authHash`, `authorizedAt`, `authorizationToken`, `authorizationTokenCreatedAt`, `authorizationTokenUsedAt`, `authorizationTokenIp`, `passwordResetHash`, `passwordResetGeneratedAt`, `orderId`, `accountId`, `brandId`, `createdAt`, `orderedAt`, `signatureDate`, `cancelledAt`, `minimumRuntimeDate`, `filingDateCancellation`, `cancelledBy`, `cancellationTechKey`, `cancellationReason`, `cancellationTriggeredDate`, `revokedAt`, `fillingDateRevocation`, `business`, `industry`, `company`, `salutation`, `firstname`, `surname`, `street`, `houseNumber`, `floor`, `zip`, `city`, `cityExtended`, `countryId`, `billing_company`, `billing_salutation`, `billing_title`, `billing_firstname`, `billing_surname`, `billing_street`, `billing_houseNumber`, `billing_phone`, `billing_fax`, `billing_email`, `billing_zip`, `billing_city`, `billing_countryId`, `billing_careOfRecipient`, `invoice_alternativeAddress`, `invoice_company`, `invoice_salutation`, `invoice_firstname`, `invoice_surname`, `invoice_street`, `invoice_houseNumber`, `invoice_phone`, `invoice_fax`, `invoice_email`, `invoice_zip`, `invoice_city`, `invoice_countryId`, `invoice_careOfRecipient`, `phone`, `fax`, `email`, `energy`, `campaignId`, `instantBonusPayoutRequested`, `instantBonusPayoutInvalidatedAt`, `instantBonusCreatedAt`, `instantBonusPaidOutAt`, `previousProviderId`, `previousProductId`, `previousVariant`, `previousProvider`, `previousProduct`, `previousProviderCodeNumber`, `previousProviderCodeNumberProvider`, `netCodeNumber`, `netCodeNumberProvider`, `netNumber`, `netSubNumber`, `netAreaNumber`, `overConsumptionWorkingPrice`, `usage`, `usageNet`, `usagePrevious`, `desiredStartDate`, `desiredStartDateOverride`, `desiredInvoiceDate`, `desiredInvoiceReason`, `startDate`, `endDate`, `nextPossibleCancellationByLfa`, `cancellationPreviousProviderSent`, `cancellationPreviousProviderStatus`, `cancellationPreviousProviderProcess`, `cancellationSucceedingProviderProcess`, `netDeliveryStartSent`, `netDeliveryStartStatus`, `netDeliveryStartProcess`, `netDeliveryStartConfirmed`, `netDeliveryEndConfirmed`, `netDeliveryEndDate`, `cancellationPreviousProviderConfirmed`, `readingDate`, `readingDateConfirmed`, `customerNumber`, `marketLocation`, `meterLocation`, `meterPointIdentifier`, `obisCode`, `isFlatRate`, `counterNumber`, `activeCounterId`, `customerSpecification`, `desiredDate`, `terminatedAt`, `relocationAt`, `basicSupplyAt`, `nextRegularExecutionAt`, `substituteSupplyAt`, `status`, `isLocked`, `privacyProtectionCheckedAt`, `legalCase`, `edifactStatus`, `cityId`, `blocked`, `disabled`, `manualBillingBlocked`, `manualBilling`, `manualBillingCleared`, `billingBlocked`, `cancellationBlocked`, `dunningLocked`, `dunningLockedUntil`, `dunningLockReason`, `counterExchange`, `billable`, `relocationProhibited`, `customerReadingRequestedAt`, `winback`, `lastWinback`, `energyTaxExemption`, `eegChargeExemption`, `accountingAllocationIndicator`, `externalId`, `regularInterval`, `groupAssignment`, `useRelationshipToGenerateInvoices`, `suppressSentForInvoiceEvent`, `customerReadingLastInvoiceRequestedId`, `revalidateDuplicates`, `lastRequestReadingInvoiceDate`, `lastRequestReadingInvoiceDateCounter`, `complexSystem`, `checkCompensationValue`, `dunningProcedureId`, `source`, `modificationDate`) VALUES
(10, NULL, NULL, '2021-07-15 17:15:02', 15, 60, 3, 'generic', 0, 5, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 1, NULL, '2020-11-02 09:01:01', '2020-11-02 09:00:38', '2020-11-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 'Max', 'Mustermann', 'Ahornweg', '5', NULL, 77746, 'Schutterwald', 'Schutterwald', 48, '', 1, '', 'Max', 'Mustermann', 'Ahornweg', '5', '0160 / 0123456', '', 'debug@powercloud.de', '77746', 'Schutterwald', NULL, '', 0, '', 0, '', '', '', '', '', '', '', 00000, '', NULL, '', '0160 / 0123456', '', 'debug@powercloud.de', 'precipitation_water', 0, 1, NULL, NULL, NULL, 777460, 2147483647, 1, 'Gemeindewerke Schutterwald', 'GWS-Grundversorgung', '9903913000003', 'bdew', '9900580000002', 'bdew', 77746001, NULL, NULL, 0, 3500, NULL, NULL, '2020-11-01', '2020-11-01', NULL, NULL, '2020-11-01', NULL, NULL, NULL, 'open', NULL, NULL, '2021-07-15 13:20:17', 'sent', '37932921071513201749999999999993023', NULL, NULL, NULL, NULL, NULL, NULL, '5958264', '98711822110', 'DE779816469620WORHLACNYPNHPUGIXXV', NULL, NULL, 0, '221548280', 2, 'desired_date', NULL, NULL, '2020-11-01', NULL, NULL, NULL, 'delivery_net', 0, NULL, NULL, NULL, 13571, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, 0, 1, 0, NULL, 0, NULL, 0, 0, 'standard', NULL, '12', 'Z15', 1, 0, NULL, 1, NULL, 0, 0, 0, 1, NULL, NULL),
(11, NULL, NULL, '2021-07-15 17:15:02', 15, 60, 3, 'generic', 0, 5, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 1, NULL, '2020-11-02 09:01:01', '2020-11-02 09:00:38', '2020-11-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 'Max', 'Mustermann', 'Ahornweg', '5', NULL, 77746, 'Schutterwald', 'Schutterwald', 48, '', 1, '', 'Max', 'Mustermann', 'Ahornweg', '5', '0160 / 0123456', '', 'debug@powercloud.de', '77746', 'Schutterwald', NULL, '', 0, '', 0, '', '', '', '', '', '', '', 00000, '', NULL, '', '0160 / 0123456', '', 'debug@powercloud.de', 'precipitation_water', 0, 1, NULL, NULL, NULL, 777460, 2147483647, 1, 'Gemeindewerke Schutterwald', 'GWS-Grundversorgung', '9903913000003', 'bdew', '9900580000002', 'bdew', 77746001, NULL, NULL, 0, 3500, NULL, NULL, '2020-11-01', '2020-11-01', NULL, NULL, '2020-11-01', NULL, NULL, NULL, 'open', NULL, NULL, '2021-07-15 13:20:17', 'sent', '37932921071513201749999999999993023', NULL, NULL, NULL, NULL, NULL, NULL, '5958264', '98711822110', 'DE779816469620WORHLACNYPNHPUGIXXV', NULL, NULL, 0, '221548280', 2, 'desired_date', NULL, NULL, '2020-11-01', '0000-00-00', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, 0, 'standard', NULL, '12', NULL, 0, 0, NULL, 0, NULL, 0, 0, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_versions`
--

CREATE TABLE `customer_versions` (
  `id` int(11) NOT NULL,
  `clientId` int(11) NOT NULL,
  `version` int(11) NOT NULL DEFAULT 1,
  `deprecated` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `customerId` bigint(20) UNSIGNED NOT NULL,
  `externalId` varchar(50) DEFAULT NULL,
  `business` tinyint(1) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `salutation` int(2) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `surname` varchar(70) DEFAULT NULL,
  `firstname` varchar(70) DEFAULT NULL,
  `street` varchar(255) NOT NULL,
  `houseNumber` varchar(16) NOT NULL,
  `zip` varchar(16) NOT NULL,
  `city` varchar(128) NOT NULL,
  `countryId` int(11) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `phoneMobile` varchar(32) DEFAULT NULL,
  `phoneMobileAreaCode` varchar(50) DEFAULT NULL,
  `phoneMobileUnified` varchar(82) DEFAULT NULL COMMENT 'full mobile phone number for search',
  `phoneHome` varchar(32) DEFAULT NULL,
  `phoneHomeAreaCode` varchar(50) DEFAULT NULL,
  `phoneHomeUnified` varchar(82) DEFAULT NULL COMMENT 'full home phone number for search',
  `phoneBusiness` varchar(32) DEFAULT NULL,
  `phoneBusinessAreaCode` varchar(50) DEFAULT NULL,
  `phoneBusinessUnified` varchar(82) DEFAULT NULL COMMENT 'full business phone number for search',
  `emailPrivate` varchar(255) DEFAULT NULL,
  `emailBusiness` varchar(255) DEFAULT NULL,
  `privacyProtectionCheckedAt` date DEFAULT NULL,
  `adsPhone` tinyint(1) DEFAULT NULL,
  `adsMail` tinyint(1) DEFAULT NULL,
  `adsPost` tinyint(1) DEFAULT NULL,
  `unknown` tinyint(1) UNSIGNED DEFAULT 0 COMMENT 'Leerstandskunde',
  `debitMandate` tinyint(4) NOT NULL DEFAULT 0,
  `mandateSignatureOn` date DEFAULT NULL,
  `mandateId` varchar(255) DEFAULT NULL,
  `customerCommunicationType` tinyint(3) NOT NULL DEFAULT 0,
  `availableSentNotification` tinyint(1) NOT NULL DEFAULT 1,
  `insolvencyStatus` enum('solvent','preliminary','ongoing','mass_deficiency') NOT NULL DEFAULT 'solvent',
  `insolvencyStartDate` date DEFAULT NULL,
  `modificationDate` datetime DEFAULT NULL COMMENT 'Änderungszeitpunkt'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_versions`
--

INSERT INTO `customer_versions` (`id`, `clientId`, `version`, `deprecated`, `createdAt`, `createdBy`, `customerId`, `externalId`, `business`, `company`, `salutation`, `title`, `surname`, `firstname`, `street`, `houseNumber`, `zip`, `city`, `countryId`, `dateOfBirth`, `phoneMobile`, `phoneMobileAreaCode`, `phoneMobileUnified`, `phoneHome`, `phoneHomeAreaCode`, `phoneHomeUnified`, `phoneBusiness`, `phoneBusinessAreaCode`, `phoneBusinessUnified`, `emailPrivate`, `emailBusiness`, `privacyProtectionCheckedAt`, `adsPhone`, `adsMail`, `adsPost`, `unknown`, `debitMandate`, `mandateSignatureOn`, `mandateId`, `customerCommunicationType`, `availableSentNotification`, `insolvencyStatus`, `insolvencyStartDate`, `modificationDate`) VALUES
(1, 3, 1, 0, '2020-10-30 16:45:56', 11, 5, NULL, 0, NULL, 1, NULL, 'Uhlig', 'Tino', 'Ahornweg', '5', '77746', 'Schutterwald', 48, '1983-02-20', '', '', NULL, '', '', NULL, '', '', NULL, '', '', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1, 'solvent', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_versions`
--
ALTER TABLE `customer_versions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contracts`
--
ALTER TABLE `contracts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `customer_versions`
--
ALTER TABLE `customer_versions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
