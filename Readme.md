# README 🤖

This project is mainly for an educational purpose, it's the direct reflect of how I currently work as an iOS Engineer. I hope you'll fin what you need, and feel free to ask me any question on it, I would be pleased to answer!

## Architecture
This architecture is splited in differents layers/concepts 🏗: 
* `Coordinator`
* `ViewControllers`
* `ViewModels`
* `Repositories`
* `Tests`

#### Coordinator:

Coordinator is a separate entity responsible for navigation in application flows. With the help of the `Screens`, it creates, presents and dismisses `UIViewControllers`, by keeping them separate and independent.
Coordinator can, create and run child coordinators too.

Since a coordinator is responsible of the entire flow of a specific flow (or stack), do not create a coordinator per viewController ☝️.

The only way of using a coordinator, is to instanciate it (by injecting in it if necessary some specific ojetcs) and call the `start()` method, and **that's all**. The entire logic will be encapsulated by delegation for the rest of the navigation.

#### Repository:

This layer is responsible of calling the `Network` layer (will be implemented later), and managing the data from it, in order to present it to the viewModel.
You can see that on the top of each repository, a protocol `RepositoryType` will allow us to test everything by dependency injection 💪.

#### ViewModel:

The `ViewModel` encapsulates the whole logic which doesn't have to be in the ViewController. It's divided in two parts :

* **Inputs**: Every event from the viewController needs to be implemented in the viewModel, since it's listening for them. 
* **Outputs**: After `startTrigger` got sent, the viewController is listening for some changes from the `viewModel`. For this, the `viewModel` needs to provide reactive var for each data/state needed. The main rule is to keep separate the UI logic between viewModel and viewController, so keep in mind that a viewModel can only `import Foundation` -> reactive var con't provide data from `UIKit` like `UIImage` for example ☝️.

If your viewModel needs a `Repository`, so you'll need to inject a `RepositoryType`, in order to mock it more easily in the tests 🏋️‍♀️

#### ViewController:

The last layer and not the less important 🙇‍♂️. But as it is mentioned in it's name, a `ViewController` only exists for **control**. So, if you want to test it, you'll only provide UI test, since the logic is extracted in the corresponding `ViewModel`. I recomand to add a custom snapshot to test it correctly.
