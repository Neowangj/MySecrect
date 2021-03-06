
## 如何为 MySecret 项目做贡献

### 1. MySecret 分支介绍
[当前的项目分支](https://github.com/DD-L/MySecrect/network)管理有些混乱，稍后会做些调整。

原则上，

* `master` 分支是稳定的主分支，并且通常情况下发布 release 都是基于此分支。
* `develop` 是开发分支，当 develop 就绪的时候，是要合并到 `master` 中去的。
* Feature branches 是为了添加新功能特性而创建的分支，最终是要合并到‘开发分支’(比如 `develop`） 中去。
* Bug fixes branches 是为修补 bug 而创建的临时分支，当它就绪时会被合并到‘开发分支’中去; `hotfixes` 分支可以一直存在, 可以合并到‘主分支’和‘开发分支’中去。
* release 分支，这个分支是专门发布 release 的分支。
* See also: [A successful Git branching model](http://nvie.com/posts/a-successful-git-branching-model/)

但 MySecret 当前并不是完全按照此模型创建和使用分支，需要提醒的是：

* ~~当前 `core` 分支作为 Feature branch 来用，主要是 GUI 开发相关的分支，这个分支可能以后会做出调整并更名。~~
* `GUI` 分支是有之前的 `core` 分支更名之后的分支，专职“图形用户界面”相关的开发。
* `CLI` 分支是 开发“命令行界面”的分支，属于 Feature branch。
* 我们暂时没有 release 分支。
* `develop` 分支是 开发分支。
* 当前的默认分支是 `develop`, 不打算将 `master` 作为默认分支。


### 2. 以下的任何一种方式，都是在为`MySecret`项目做贡献

#### 方式一: 创建一个[`new issue`](https://github.com/DD-L/MySecrect/issues) 为 MySecret 贡献 ideas

以下是抄来的，我就不翻译了：
 
> 1. Look through existing issues to see if your issue already exists.
> 2. If your issue already exists, comment on its thread with any information you have. Even if this is simply to note that you are having the same problem, it is still helpful!
> 3. Always be as descriptive as you can.
> 4. What is the expected behavior? What is the actual behavior? What are the steps to reproduce?
> 5. Attach screenshots, videos, GIFs if possible.
> 6. Include library version or branch experiencing the issue.
> 7. Include OS version and devices experiencing the issue.

#### 方式二: 提交一个 pull request (PR) 为 MySecret 贡献代码

* *尚未创建组织，目前仅支持 fork + PR 的贡献代码的方式*
* *以下出现`推荐`、`最好`等建议型词汇，都是非强制的，按照你自己的喜好也可以*

1. 找一个开放的 [issue](https://github.com/DD-L/MySecrect/issues)，或创建一个新的 [issue](https://github.com/DD-L/MySecrect/issues)，写一些东西，然后记下 issue 编号#。(推荐提交 PR 前，先创建 issue，换言之，“PR 最好和 issue 关联起来”)
2. Fork 这个 repo，确保你同步的是‘开发分支’上的最近的更新。
3. Fork 之后，你自己 github 账户下会多一个 repo，然后再 clone 到本地，获得代码。

	```shell
	$ # clone 指定远程分支(通常是 develop) 到本地的 ./MySecret 目录
	$ git clone -b <branch> https://github.com/<yourusername>/MySecret
	$ cd MySecret
	$ # 添加 上游，以便以后能随时同步 上游改动
	$ git remote add upstream https://github.com/DD-L/MySecrect.git
	$ # 同步子模块
	$ git submodule init
	$ git submodule update
	```

4. 基于某分支创建一个新分支，可以是 Feature branch 或 Bug fixes branch。比如：

	```shell
	$ # 从 本地的 开发分支（通常是 develop）检出一个新分支，并切换的到新分支 
	$ # 推荐这种命名方式（非强制）
	$ git checkout -b issue_<##>_<description> develop
	```

5. 在你新建的分支上完成开发测试，并编写相应的开发文档 （文档放在 doc 目录下）。
6. ~~在提交 PR 前，最好先添加一个 DD-L/MySecrect 的远程源：`git remote add <自定义远程源名字> https://github.com/DD-L/MySecrect.git`， 然后`git pull <自定义远程源名字> <远程源下的一个 branch 名字, 通常是 develop>`, 以便查看是否同 DD-L/MySecret 有文件冲突，文件冲突由两人同时修改相同文件造成的。良好的习惯是解决好冲突后，再提交 PR~~。
7. 在提交 PR 前，最好先同步一下上游的改动，以避免提交 PR 时可能的文件冲突
	
	```shell
	$ git checkout develop
	$ # 拉取 上游
	$ git fetch upstream
	$ # 合并 上游develop分支 到 当前的本地分支去
	$ git merge upstream/develop
	$ # 合并 到你新建的分支 中去
	$ git checkout <yourbranchname>
	$ git merge --no-ff develop
	$ # 如果有文件冲突，修改冲突文件，然后 commit 即可。
	``` 
8. 将本地分支的 commit 都 push 到你的远程仓库的分支 `git push -u origin <yourbranchname>`，如果你 fork 的远程 repo 中没有这个名字的分支，该命令会自动创建一个新远程分支。
9. 然后在 github 上，你 fork 的 repo 里切换到你新建的远程分支，创建 PR `New pull requset` 。随后在页面的左边，选择你要提交的目的地，这里通常是 base fork: DD-L/MySerect base: develop，意思是 请求合并到 DD-L/MySerect 的 develop 分支下；右边是 你要提交的分支。
10. 如果出现“` Able to merge. These branches can be automatically merged.`”字样，恭喜你可以开开心心的提交；如果提示 不能自动合并，说明有冲突，请先解决冲突后再提交 PR。如果 repo 拥有者看到一个有冲突的 分支请求合并，会很不舒服，甚至会直接忽略掉这个 PR。
11. 在 创建 PR 的页面会有一个 comment，在最好里面写一些描述性信息，或 直接写 "See #1234 or Fix #1234" 之类的文字（#后面的数字是你第一步创建的 issue 编号），这样就能自动和 [issue](https://github.com/DD-L/MySecrect/issues) 关联起来。