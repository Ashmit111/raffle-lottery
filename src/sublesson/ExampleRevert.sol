// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract ExampleRevert {
    error ExampleRevert_Error();

    function revertWithError() public pure {
        if (false) {
            revert ExampleRevert_Error();
        }
    }

    function revertWithRequire() public pure {
        require(true, "ExampleRevert_Error");
    }
}