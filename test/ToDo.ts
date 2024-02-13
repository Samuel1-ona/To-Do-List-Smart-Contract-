import { loadFixture } from "@nomicfoundation/hardhat-toolbox/network-helpers";

import { expect } from "chai";
import { ethers } from "hardhat";

describe("ToDo", function () {
  // We define a fixture to reuse the same setup in every test.
  // We use loadFixture to run this setup once, snapshot that state,
  // and reset Hardhat Network to that snapshot in every test.
  async function deployToDo() {
    // Contracts are deployed using the first signer/account by default
    const [owner, otherAccount] = await ethers.getSigners();

    const ToDo = await ethers.getContractFactory("ToDo");
    const todo = await ToDo.deploy();

    return { todo, owner, otherAccount };
  }

  describe("Checking if all the Todo input are correct", function () {
    it("should show that the input in the array are in order  ", async function () {
      const { todo } = await loadFixture(deployToDo);

      await todo.addTodoList("Task 1", "Description 1");
      const tasks = await todo.getTodoList();
      expect(tasks.length).to.equal(1);
      expect(tasks[0].title).to.equal("Task 1");
      expect(tasks[0].descriptions).to.equal("Description 1");
      expect(tasks[0].isDone).to.be.false;
    });

  });
  describe("")
});
