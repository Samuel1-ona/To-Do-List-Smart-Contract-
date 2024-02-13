// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract ToDo {
    uint256 public taskId;

    struct Lists {
        uint256 id;
        string title;
        string descriptions;
        bool isDone;
    }

      Lists[]  lists;

       function addTodoList(string memory _title, string memory _descriptions) external {
        Lists memory newList = Lists(lists.length, _title, _descriptions, false);
        lists.push(newList);
        taskId++;
        
    }

}
