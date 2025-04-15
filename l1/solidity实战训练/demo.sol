contract Demo {
    struct Todo {
        string name;
        bool isCompleted;
    }
    Todo[] public list; 

    function create(string memory name_) external {
        list.push(
            Todo({
                name:name_,
                isCompleted:false
            })
        );
    }

    function modiName1(uint256 index_,string memory name_) external {
        // 方法1: 直接修改，修改一个属性时候比较省 gas
        //多个属性的话会多次读写链上slot
        list[index_].name = name_;
    }
    function modiName2(uint256 index_,string memory name_) external {
        // 方法2: 先获取储存到 storage，在修改，在修改多个属性的时候比较省 gas
        //获取一个引用先。这样只用一次读写链上slot
        Todo storage temp = list[index_];
        temp.name = name_;
    }
    // 修改完成状态:自动切换 toggle
    function modiStatus(uint256 index_) external {
        list[index_].isCompleted = !list[index_].isCompleted;
    }
    // 获取任务1: memory : 2次拷贝
    // 29448 gas
    function get1(uint256 index_) external view
        returns(string memory name_,bool status_){
        Todo memory temp = list[index_];
        return (temp.name,temp.isCompleted);
    }

}