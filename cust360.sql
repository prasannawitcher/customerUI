-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2022 at 02:07 PM
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
(1, 1, 'repay', '0.00', '0.00', '0.00', '0.00', NULL, NULL, NULL, 0, NULL, 0, NULL),
(2, 3, 'creditor', '0.00', '0.00', '0.00', '0.00', '2021-12-15 10:09:43', '2021-12-15 10:09:43', NULL, 0, NULL, 0, '2021-12-15 10:09:43');

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
(11, NULL, NULL, '2021-07-15 17:15:02', 15, 60, 3, 'generic', 0, 5, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 2, NULL, '2020-11-02 09:01:01', '2020-11-02 09:00:38', '2020-11-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 'Max', 'Mustermann', 'Ahornweg', '5', NULL, 77746, 'Schutterwald', 'Schutterwald', 48, '', 1, '', 'Max', 'Mustermann', 'Ahornweg', '5', '0160 / 0123456', '', 'debug@powercloud.de', '77746', 'Schutterwald', NULL, '', 0, '', 0, '', '', '', '', '', '', '', 00000, '', NULL, '', '0160 / 0123456', '', 'debug@powercloud.de', 'precipitation_water', 0, 1, NULL, NULL, NULL, 777460, 2147483647, 1, 'Gemeindewerke Schutterwald', 'GWS-Grundversorgung', '9903913000003', 'bdew', '9900580000002', 'bdew', 77746001, NULL, NULL, 0, 3500, NULL, NULL, '2020-11-01', '2020-11-01', NULL, NULL, '2020-11-01', NULL, NULL, NULL, 'open', NULL, NULL, '2021-07-15 13:20:17', 'sent', '37932921071513201749999999999993023', NULL, NULL, NULL, NULL, NULL, NULL, '5958264', '98711822110', 'DE779816469620WORHLACNYPNHPUGIXXV', NULL, NULL, 0, '221548280', 2, 'desired_date', NULL, NULL, '2020-11-01', '0000-00-00', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, 0, 'standard', NULL, '12', NULL, 0, 0, NULL, 0, NULL, 0, 0, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contract_readings`
--

CREATE TABLE `contract_readings` (
  `id` int(10) UNSIGNED NOT NULL,
  `clientId` int(11) UNSIGNED NOT NULL,
  `contractId` bigint(20) UNSIGNED NOT NULL,
  `incomingGpkeActionId` int(11) UNSIGNED DEFAULT NULL,
  `incomingFileIdentifier` varchar(20) DEFAULT NULL,
  `incomingMessageIdentifier` varchar(100) DEFAULT NULL,
  `incomingMessageId` int(11) UNSIGNED DEFAULT NULL,
  `incomingMessageDateTime` datetime DEFAULT NULL,
  `incomingBgmCode` varchar(3) DEFAULT NULL,
  `incomingDocumentNumber` varchar(35) DEFAULT NULL,
  `addReadingGpkeActionId` int(11) UNSIGNED DEFAULT NULL,
  `addReadingFileIdentifier` varchar(14) DEFAULT NULL,
  `addReadingMessageIdentifier` varchar(20) DEFAULT NULL,
  `addReadingDocumentNumber` varchar(35) DEFAULT NULL,
  `addReadingFileSentAt` datetime DEFAULT NULL,
  `cancelReadingGpkeActionId` int(11) UNSIGNED DEFAULT NULL,
  `cancelReadingFileIdentifier` varchar(14) DEFAULT NULL,
  `cancelReadingMessageIdentifier` varchar(20) DEFAULT NULL,
  `cancelReadingDocumentNumber` varchar(35) DEFAULT NULL,
  `cancelReadingFileSentAt` datetime DEFAULT NULL,
  `sender` varchar(255) DEFAULT NULL,
  `senderProvider` varchar(5) DEFAULT NULL,
  `recipient` varchar(255) DEFAULT NULL,
  `recipientProvider` varchar(5) DEFAULT NULL,
  `readingType` enum('9','1') DEFAULT NULL,
  `referenceType` enum('AGI','ACW') DEFAULT NULL,
  `referenceNumber` varchar(70) DEFAULT NULL,
  `cciReason` enum('COM','IOM','ROM','COS','COB','CMP','PMR','COT') DEFAULT NULL,
  `cciParametersProperty` enum('SMV','EMV','MRV') DEFAULT NULL,
  `obisCode` varchar(50) DEFAULT NULL COMMENT 'It is reading specific obis code, is completely different that from counter.',
  `counterNumber` varchar(70) NOT NULL,
  `counterMeterId` int(11) UNSIGNED NOT NULL,
  `correctionOf` int(11) UNSIGNED DEFAULT NULL,
  `cancellationOf` int(11) UNSIGNED DEFAULT NULL,
  `netBillable` tinyint(1) NOT NULL DEFAULT 0,
  `triggerInvoice` tinyint(1) NOT NULL DEFAULT 0,
  `triggerSkipped` tinyint(1) NOT NULL DEFAULT 0,
  `valid` tinyint(1) NOT NULL DEFAULT 1,
  `forcedValid` tinyint(1) DEFAULT 0,
  `forcedBy` int(11) UNSIGNED DEFAULT NULL,
  `validityChangedBy` int(11) DEFAULT NULL,
  `validityChangedAt` datetime DEFAULT NULL,
  `implausibleReason` enum('already_in_billed_period_and_does_not_reverse_invoice','already_in_billed_period_and_does_reverse_invoice','counter_number_invalid','duplicate_reading','duplicate_reading_higher_priority','difference_in_usage_is_implausible','edi_document_date_is_older_than_previous_one','edi_document_number_is_smaller_than_previous_one','exists_future_reading_with_smaller_value','exists_previous_reading_with_higher_value','implausible_network_carrier_changed_reading','is_cancellation_reading','is_corrected_due_invoice_look_ahead','is_corrected_due_invoice_look_behind','invalidated_due_to_counter_exchange','forced_to_be_implausible','manually_invalidated','reading_priority_is_not_plausible','obis_code_invalid','out_of_delivery_period','reading_of_counter_not_complete','read_in_future','identical_reading_in_tolerance','reading_is_cancelled','reading_usage_sum_is_not_plausible','reading_with_higher_priority_received','high_consumption','low_consumption','zero_consumption','lower_than_current','unknown_reason') DEFAULT NULL,
  `implausibleReasonExplanation` varchar(255) DEFAULT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `userInteractionGpkeActionId` int(11) UNSIGNED DEFAULT NULL,
  `readAt` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `processingDate` date DEFAULT NULL,
  `value` decimal(20,4) DEFAULT NULL,
  `priority` tinyint(3) UNSIGNED NOT NULL,
  `type` enum('mscons_reading_movein','mscons_reading_moveout','mscons_reading_regular','mscons_reading_inbetween','mscons_reading_installation','mscons_reading_removal','manual_reading','helper','helper_create_invoice','mscons_reading_parameter_start','mscons_reading_parameter_end') NOT NULL DEFAULT 'mscons_reading_inbetween',
  `qualifier` enum('read','estimated','suggested','forecast','sum','junk') DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deletedBy` int(11) UNSIGNED DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `reversedAt` datetime DEFAULT NULL,
  `origin` enum('customer','vnb','third_party','previous_provider','msb') DEFAULT NULL,
  `channelText` varchar(55) DEFAULT NULL,
  `channelKey` varchar(55) DEFAULT NULL,
  `valueType` enum('220','67','201','20','187','79','Z18','A','E','F','S') DEFAULT NULL,
  `modificationDate` datetime DEFAULT NULL COMMENT 'Änderungszeitpunkt'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contract_readings`
--

INSERT INTO `contract_readings` (`id`, `clientId`, `contractId`, `incomingGpkeActionId`, `incomingFileIdentifier`, `incomingMessageIdentifier`, `incomingMessageId`, `incomingMessageDateTime`, `incomingBgmCode`, `incomingDocumentNumber`, `addReadingGpkeActionId`, `addReadingFileIdentifier`, `addReadingMessageIdentifier`, `addReadingDocumentNumber`, `addReadingFileSentAt`, `cancelReadingGpkeActionId`, `cancelReadingFileIdentifier`, `cancelReadingMessageIdentifier`, `cancelReadingDocumentNumber`, `cancelReadingFileSentAt`, `sender`, `senderProvider`, `recipient`, `recipientProvider`, `readingType`, `referenceType`, `referenceNumber`, `cciReason`, `cciParametersProperty`, `obisCode`, `counterNumber`, `counterMeterId`, `correctionOf`, `cancellationOf`, `netBillable`, `triggerInvoice`, `triggerSkipped`, `valid`, `forcedValid`, `forcedBy`, `validityChangedBy`, `validityChangedAt`, `implausibleReason`, `implausibleReasonExplanation`, `locked`, `userInteractionGpkeActionId`, `readAt`, `createdAt`, `processingDate`, `value`, `priority`, `type`, `qualifier`, `deleted`, `deletedBy`, `deletedAt`, `reversedAt`, `origin`, `channelText`, `channelKey`, `valueType`, `modificationDate`) VALUES
(1, 3, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1-1:1.8.0', '950875031', 5, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2020-08-01 00:00:00', '2020-11-04 09:07:17', NULL, '0.0000', 2, 'mscons_reading_movein', 'read', 0, NULL, NULL, NULL, 'customer', 'Kundenportal', 'KUNDENPORTAL', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contract_tariffs`
--

CREATE TABLE `contract_tariffs` (
  `id` int(11) UNSIGNED NOT NULL,
  `clientId` int(11) UNSIGNED NOT NULL,
  `createdAt` datetime NOT NULL,
  `contractId` bigint(20) UNSIGNED DEFAULT NULL,
  `priceAdjustmentOf` int(11) UNSIGNED DEFAULT NULL,
  `contractProductId` int(11) UNSIGNED DEFAULT NULL,
  `campaign` varchar(255) DEFAULT NULL,
  `campaignId` int(11) NOT NULL,
  `campaignReferenceId` int(10) UNSIGNED NOT NULL,
  `providerId` bigint(20) DEFAULT NULL,
  `providerEmail` varchar(255) DEFAULT NULL,
  `productId` bigint(20) NOT NULL,
  `productVersionId` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'A direct product version link if providerId is not been used.',
  `variant` int(11) NOT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `product` varchar(255) NOT NULL,
  `productBonus` decimal(10,6) NOT NULL,
  `productBonusPercent` float DEFAULT 0,
  `productInstantBonus` float NOT NULL DEFAULT 0,
  `includeBonusInDepositCalculation` tinyint(1) NOT NULL DEFAULT 0,
  `productEco` tinyint(4) NOT NULL,
  `productType` enum('standard','package','budget') NOT NULL DEFAULT 'standard',
  `priceKey` varchar(255) DEFAULT NULL,
  `usageInclusive` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `usageCustomer` int(11) DEFAULT NULL,
  `minimumRuntime` float NOT NULL,
  `minimumRuntimeType` enum('days','months') NOT NULL DEFAULT 'months',
  `extensionTime` float NOT NULL,
  `extensionTimeType` enum('days','weeks','months') NOT NULL DEFAULT 'months',
  `everyTimeCancellable` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `fixedPriceType` enum('none','energy','fix','goodwill') NOT NULL DEFAULT 'none',
  `fixedPriceMonths` float UNSIGNED DEFAULT NULL,
  `fixedPriceDate` date DEFAULT NULL,
  `cancellationPeriod` float NOT NULL,
  `cancellationPeriodType` enum('days','weeks','months') NOT NULL DEFAULT 'days',
  `depositDivisor` int(2) UNSIGNED NOT NULL,
  `workingPrice` float NOT NULL,
  `basePrice` float NOT NULL,
  `meterCharge` float NOT NULL,
  `overConsumptionWorkingPrice` float NOT NULL DEFAULT 0,
  `activeFrom` date NOT NULL,
  `activeFromOriginal` date DEFAULT NULL,
  `activeUntil` date DEFAULT NULL,
  `migrationSkipped` tinyint(1) NOT NULL DEFAULT 0,
  `billingPeriod` int(11) NOT NULL DEFAULT 12 COMMENT 'Abrechnungsturnus in Monaten',
  `complexPrice` tinyint(1) NOT NULL DEFAULT 0,
  `priceAdjustmentReason` varchar(250) DEFAULT NULL COMMENT 'reason for price adjustment',
  `tariffChangeDate` date DEFAULT NULL COMMENT 'Produktwechseldatum',
  `meterPricing` enum('included','price_table','passing_ims_meter_charges') NOT NULL DEFAULT 'included' COMMENT 'Type of meter price transfer',
  `isRevoked` tinyint(1) NOT NULL DEFAULT 0,
  `calculatedFixedPriceDate` date DEFAULT NULL,
  `modificationDate` datetime DEFAULT NULL COMMENT 'Änderungszeitpunkt'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contract_tariffs`
--

INSERT INTO `contract_tariffs` (`id`, `clientId`, `createdAt`, `contractId`, `priceAdjustmentOf`, `contractProductId`, `campaign`, `campaignId`, `campaignReferenceId`, `providerId`, `providerEmail`, `productId`, `productVersionId`, `variant`, `provider`, `product`, `productBonus`, `productBonusPercent`, `productInstantBonus`, `includeBonusInDepositCalculation`, `productEco`, `productType`, `priceKey`, `usageInclusive`, `usageCustomer`, `minimumRuntime`, `minimumRuntimeType`, `extensionTime`, `extensionTimeType`, `everyTimeCancellable`, `fixedPriceType`, `fixedPriceMonths`, `fixedPriceDate`, `cancellationPeriod`, `cancellationPeriodType`, `depositDivisor`, `workingPrice`, `basePrice`, `meterCharge`, `overConsumptionWorkingPrice`, `activeFrom`, `activeFromOriginal`, `activeUntil`, `migrationSkipped`, `billingPeriod`, `complexPrice`, `priceAdjustmentReason`, `tariffChangeDate`, `meterPricing`, `isRevoked`, `calculatedFixedPriceDate`, `modificationDate`) VALUES
(10, 3, '2020-11-02 09:01:01', 10, NULL, 10, 'standard', 3, 0, -4, NULL, 3, 3, 1, 'StromAG', 'Basistarif', '0.000000', 0, 30, 0, 0, 'standard', '', 0, 3500, 12, 'months', 12, 'months', 0, 'none', NULL, NULL, 30, 'days', 12, 27.0315, 67.28, 16.18, 0, '2020-11-01', NULL, NULL, 0, 12, 1, NULL, NULL, 'included', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contract_vehicles`
--

CREATE TABLE `contract_vehicles` (
  `id` int(11) UNSIGNED NOT NULL,
  `clientId` int(11) UNSIGNED NOT NULL,
  `customerId` bigint(20) UNSIGNED NOT NULL,
  `contractId` bigint(20) UNSIGNED DEFAULT NULL,
  `countryOfRegistrationId` int(11) UNSIGNED NOT NULL,
  `createdAt` datetime NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `licensePlate` varchar(16) NOT NULL,
  `type` enum('ecar','ebus','ship') NOT NULL COMMENT 'Fahrzeugtyp',
  `modificationDate` datetime DEFAULT NULL COMMENT 'Änderungszeitpunkt'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contract_vehicles`
--

INSERT INTO `contract_vehicles` (`id`, `clientId`, `customerId`, `contractId`, `countryOfRegistrationId`, `createdAt`, `manufacturer`, `model`, `licensePlate`, `type`, `modificationDate`) VALUES
(1, 3, 5, 10, 0, '2022-01-07 14:05:20', '', '', 'WWWWW', '', '2022-01-07 14:05:20');

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

-- --------------------------------------------------------

--
-- Table structure for table `product_versions`
--

CREATE TABLE `product_versions` (
  `id` int(11) UNSIGNED NOT NULL,
  `clientId` int(11) UNSIGNED NOT NULL,
  `productId` int(11) UNSIGNED NOT NULL,
  `version` int(11) UNSIGNED NOT NULL,
  `status` enum('draft','release_requested','released','locked','expired','deprecated') DEFAULT NULL,
  `calculationId` int(11) UNSIGNED DEFAULT NULL,
  `importId` int(11) UNSIGNED DEFAULT NULL,
  `genericId` int(11) UNSIGNED DEFAULT NULL,
  `emobilityEntityId` int(11) UNSIGNED DEFAULT NULL,
  `createdBy` int(11) UNSIGNED NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedBy` int(11) UNSIGNED NOT NULL,
  `updatedAt` datetime NOT NULL,
  `assignedTo` int(11) UNSIGNED NOT NULL,
  `releaseRequestedBy` int(11) UNSIGNED DEFAULT NULL,
  `releaseRequestedAt` datetime DEFAULT NULL,
  `releasedBy` int(11) UNSIGNED DEFAULT NULL,
  `releasedAt` datetime DEFAULT NULL,
  `deprecatedBy` int(11) UNSIGNED DEFAULT NULL,
  `deprecatedAt` datetime DEFAULT NULL,
  `lockedBy` int(11) UNSIGNED DEFAULT NULL,
  `lockedAt` datetime DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `validFrom` date DEFAULT NULL,
  `validUntil` date DEFAULT NULL,
  `brandId` int(11) UNSIGNED DEFAULT NULL,
  `kind` enum('contract','one_time','runtime_product') DEFAULT NULL,
  `invoiceBase` enum('order','delivery','reading') DEFAULT NULL,
  `contractInvoiceCycle` enum('interval','trigger','none') DEFAULT NULL,
  `contractInvoiceCycleInterval` int(11) UNSIGNED DEFAULT NULL,
  `contractInvoiceCycleIntervalType` enum('days','weeks','months','years') DEFAULT NULL,
  `contractInitialDuration` int(11) UNSIGNED DEFAULT NULL,
  `contractInitialDurationType` enum('days','weeks','months','years') DEFAULT NULL,
  `contractExtensionTime` int(11) UNSIGNED DEFAULT NULL,
  `contractExtensionTimeType` enum('days','weeks','months','years') DEFAULT NULL,
  `contractCancellationPeriod` int(11) UNSIGNED DEFAULT NULL,
  `contractCancellationPeriodType` enum('days','weeks','months','years') DEFAULT NULL,
  `contractDepositDivisor` int(2) UNSIGNED NOT NULL,
  `everyTimeCancellable` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `erpExternalId` varchar(255) DEFAULT NULL,
  `erpWeight` float DEFAULT NULL COMMENT 'in kg',
  `erpStatisticGroup` varchar(255) DEFAULT NULL,
  `erpVolume` float DEFAULT NULL COMMENT 'in m^3',
  `erpVariantGroupCode` varchar(255) DEFAULT NULL,
  `erpProductLink` varchar(255) DEFAULT NULL,
  `erpManufacturer` varchar(255) DEFAULT NULL,
  `erpManufacturerNumber` varchar(255) DEFAULT NULL,
  `erpAccount` varchar(50) DEFAULT NULL,
  `erpAllowSplitAmount` tinyint(1) NOT NULL DEFAULT 0,
  `cmsAgb` text DEFAULT NULL,
  `cmsProperties` text DEFAULT NULL,
  `cmsDescriptionInternal` text DEFAULT NULL,
  `cmsDescriptionExternal` text DEFAULT NULL,
  `cmsFileId` int(11) UNSIGNED DEFAULT NULL,
  `noteFreetext` text DEFAULT NULL,
  `contractMinCreditRating` decimal(5,2) DEFAULT NULL,
  `procurementPrice` decimal(10,5) UNSIGNED DEFAULT NULL,
  `surchargeVariable` decimal(10,5) UNSIGNED DEFAULT NULL,
  `surchargeFix` decimal(10,5) UNSIGNED DEFAULT NULL,
  `creditCheckType` int(11) NOT NULL DEFAULT 0,
  `relocationProhibited` tinyint(4) NOT NULL DEFAULT 0,
  `meterPricing` enum('included','price_table','passing_ims_meter_charges') NOT NULL DEFAULT 'included' COMMENT 'Type of meter price transfer',
  `modificationDate` datetime DEFAULT NULL COMMENT 'Änderungszeitpunkt',
  `tenantElectricity` enum('TeCustomer','TeObject','TeTransition') DEFAULT NULL,
  `billingRuleTemplateId` int(11) UNSIGNED DEFAULT NULL,
  `simulationForDeposit` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_versions`
--

INSERT INTO `product_versions` (`id`, `clientId`, `productId`, `version`, `status`, `calculationId`, `importId`, `genericId`, `emobilityEntityId`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`, `assignedTo`, `releaseRequestedBy`, `releaseRequestedAt`, `releasedBy`, `releasedAt`, `deprecatedBy`, `deprecatedAt`, `lockedBy`, `lockedAt`, `name`, `validFrom`, `validUntil`, `brandId`, `kind`, `invoiceBase`, `contractInvoiceCycle`, `contractInvoiceCycleInterval`, `contractInvoiceCycleIntervalType`, `contractInitialDuration`, `contractInitialDurationType`, `contractExtensionTime`, `contractExtensionTimeType`, `contractCancellationPeriod`, `contractCancellationPeriodType`, `contractDepositDivisor`, `everyTimeCancellable`, `erpExternalId`, `erpWeight`, `erpStatisticGroup`, `erpVolume`, `erpVariantGroupCode`, `erpProductLink`, `erpManufacturer`, `erpManufacturerNumber`, `erpAccount`, `erpAllowSplitAmount`, `cmsAgb`, `cmsProperties`, `cmsDescriptionInternal`, `cmsDescriptionExternal`, `cmsFileId`, `noteFreetext`, `contractMinCreditRating`, `procurementPrice`, `surchargeVariable`, `surchargeFix`, `creditCheckType`, `relocationProhibited`, `meterPricing`, `modificationDate`, `tenantElectricity`, `billingRuleTemplateId`, `simulationForDeposit`) VALUES
(1, 3, 1, 1, 'deprecated', 1, NULL, NULL, NULL, 11, '2020-04-21 12:42:11', 11, '2020-04-21 12:43:25', 12, NULL, NULL, 11, '2020-10-21 12:43:25', 11, '2020-10-28 17:22:33', NULL, NULL, 'Basistarif', '2009-07-01', '2025-07-01', NULL, 'contract', 'reading', 'interval', 12, 'months', 0, 'days', 0, 'days', 0, 'days', 12, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', NULL, '', '0.00', '0.00000', '0.00000', '0.00000', 0, 0, 'included', NULL, NULL, 23, 0);

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
-- Indexes for table `contract_vehicles`
--
ALTER TABLE `contract_vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contract_vehicles_customerId__customer_id` (`customerId`),
  ADD KEY `contract_vehicles_clientId__clients_id` (`clientId`),
  ADD KEY `contract_vehicles_contractId__contracts_id` (`contractId`),
  ADD KEY `contract_vehicles_countryOfRegistrationId__countries_id` (`countryOfRegistrationId`),
  ADD KEY `modificationDate` (`modificationDate`);

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contracts`
--
ALTER TABLE `contracts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `contract_vehicles`
--
ALTER TABLE `contract_vehicles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_versions`
--
ALTER TABLE `customer_versions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
