# Contributing to Pycheron

Thank you for your willingness to contribute to the Pycheron project.  The procedure to do so is the following:

## Create a GitHub Issue

Navigate to Pycheron's [GitHub Issues page](https://github.com/sandialabs/pycheron/issues) and create a new issue.  The issue can be used for any number of things&mdash;reporting a bug, suggesting an enhancement, posing a question, etc.  On the new issue creation page, you'll notice the *Description* field will be pre-populated with some text.  Follow the instructions in that template to give us as much information as you can such that we can tackle the issue as soon as is practicable.

## Work an Issue

When work is ready to commence on an issue, the workflow to use is the following:

### Fork Pycheron

* If you have not already done so, create a fork of Pycheron on GitHub under your username.
* Clone your fork of Pycheron with `git clone git@github.com:<username>/pycheron`.
* Each time you clone your fork, `git remote add upstream git@github.com:sandialabs/pycheron` to add the original Pycheron repository as the `upstream` remote.

### Update the Main Development Branches

To keep your `github` and `develop` branches up-to-date with those from `upstream`:

* `git fetch --all`
* `git checkout github`
* `git merge upstream/github`
* `git push origin github`
* `git checkout develop`
* `git merge upstream/develop`
* `git push origin develop`

You want to do this before starting work on a new feature branch.

> **Note:**  Updating `github` is not strictly necessary, as all development work is done off of `develop`.

### Create a Feature Branch

Create a local branch off of `develop` on which to make your changes:

* `git checkout develop`
* `git checkout -b <branchName>`

`<branchName>` can be whatever you like, though we have some recommendations:
* Include the issue number in it in some way, for instance, `123-<restOfBranchName>`, or `<restOfBranchName>-123`.
* Make the branch name descriptive; that is, avoid `fixSomeStuff`, `performanceTweaks`, and generic names along those lines.
* To indicate your branch is intended solely for your own use, preface the branch name with your username, as in `<username>/<restOfBranchName>`.

### Make Your Changes

Do whatever work is necessary to address the issue you're tackling, breaking your work into logical, compilable commits.

### Update Your Branch

While working on your feature in your local `<branchName>` branch, other commits will likely make it into the real Pycheron `develop` branch.  There are a variety of ways to merge these changes into your local feature branch.  One possibility is

* `git checkout <branchName>`
* `git fetch --all`
* `git merge upstream/develop`

though there are others that are equally valid.

### Create a Pull Request

When your changes are ready to be integrated into Pycheron's `develop` branch:

* Push your local feature branch up to your fork with `git push -u origin <branchName>`.
* Navigate to your fork of Pycheron on GitHub and create a new pull request:
  * Be sure you choose:
    * base fork:  `sandialabs/pycheron`
    * base:  `develop`
    * head fork:  `<username>/pycheron`
    * compare:  `<branchName>`
  * On the new pull request creation page, you'll notice the *Description* field will be pre-populated with some text.  Follow the instructions in that template to give us as much information as you can such that we can review and approve the issue as soon as is practicable.

### Feedback

At this point you'll enter into a stage where you and various pycheron developers will iterate back and forth until your changes are in an acceptable state and can be merged in.  If you need to make changes to your pull request, make additional commits on your `<branchName>` branch and push them up to your fork.  Make sure you don't delete your remote feature branch or your fork of pycheron before your pull request has been merged.
