pragma solidity ^0.8.0;

// SPDX-License-Identifier: apache 2.0
/*
    Copyright 2020 Sigmoid Foundation <info@SGM.finance>
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

import "erc3475/IERC3475.sol";

interface IBankBondManager {
    enum InterestRateType {FixedRate, FloatingRate}

    function setBankData(address _bankData) external;
    function updateCanPurchase(uint classIdIn, uint classIdOut, bool _canPurchase) external;
    function setBenchmarkInterest(uint _benchmarkInterest) external;
    function createClassMetadatas(uint256[] memory metadataIds, IERC3475.Metadata[] memory metadatas) external;
    function createClass(uint256 classId, string memory symbol, address tokenAddress, InterestRateType interestRateType, uint256 period) external;

    function issueBonds(address to, uint256[] memory classIds, uint256[] memory amounts) external;
    function redeemERC3475(address from, uint classId, uint nonceId, uint amount) external;


    function getProgress(uint256 classId, uint256 nonceId) external view returns (uint256 progressAchieved, uint256 progressRemaining);
    function getETA(uint256 classId, uint256 nonceId) external view returns (uint256);
    function classValues(uint256 classId) public view returns (address _tokenAddress, InterestRateType _interestRateType, uint256 _periodTimestamp);
    function getClasses() external view returns (uint[] memory);
}



