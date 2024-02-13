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
    function updateTask(uint256 _taskId , string memory _title , string memory _descriptions)external  returns (Lists memory){

        require(_taskId < lists.length , "NO UPDATE MADE" );
        return lists[_taskId] = Lists(_taskId, _title , _descriptions, false);
    }

    function getTodoList() public view returns (Lists[] memory) {
        return lists;
    }

    function deleteCompletedTask(uint256 _taskId) external{
        require(_taskId < lists.length , "Task Id is out of reach");

        lists[_taskId] = lists[lists.length- 1];
        lists.pop();

    }

}
