pragma solidity >=0.8.0;

// SPDX-License-Identifier: apache 2.0
/*
    Copyright 2022 Debond Protocol <info@debond.org>
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at
    http://www.apache.org/licenses/LICENSE-2.0
    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

import "../BankBondManager.sol";

interface IBankData {

    function updateCanPurchase(uint classIdIn, uint classIdOut, bool _canPurchase) external;

    function setTokenInterestRateSupply(address tokenAddress, BankBondManager.InterestRateType, uint amount) external;

    function setTokenTotalSupplyAtNonce(address tokenAddress, uint nonceId, uint amount) external;

    function pushClassIdPerToken(address tokenAddress, uint classId) external;

    function addNewClassId(uint classId) external;

    function setTokenAddressWithBondValue(uint value, address tokenAddress) external;

    function setBondValueFromTokenAddress(address tokenAddress, uint value) external;

    function setTokenAddressExists(address tokenAddress, bool exist) external;

    function incrementTokenAddressCount() external;

    function setBenchmarkInterest(uint benchmarkInterest) external;




    function getBaseTimestamp() external view returns (uint);

    function canPurchase(uint classIdIn, uint classIdOut) external view returns (bool);

    function getClasses() external view returns (uint[] memory);

    function getTokenInterestRateSupply(address tokenAddress, BankBondManager.InterestRateType) external view returns (uint);

    function getClassIdsFromTokenAddress(address tokenAddress) external view returns (uint[] memory);

    function getTokenAddressFromBondValue(uint value) external view returns (address);

    function getTokenTotalSupplyAtNonce(address tokenAddress, uint nonceId) external view returns (uint);

    function getBondValueFromTokenAddress(address tokenAddress) external view returns (uint);

    function tokenAddressExist(address tokenAddress) external view returns (bool);

    function tokenAddressCount() external view returns (uint);

    function getBenchmarkInterest() external view returns (uint);

}
