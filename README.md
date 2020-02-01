# ArticleAppDemo

Most Popular Articles API and show a list of articles, that shows details when items on the list are tapped (a typical master/detail app) using clean architecture 

# Content


 * Structure Overview
 * How To Run
 * Unit Testing and Coverage
 * Screenshots
 * App Features
 
 
 # Structure Overview
 
 * **Configurator**: Contains **ArticlesConfigurator** and **ArticleDetailConfigurator** files. Configurator intialize all clean archecture files. This part is optional we can do it view controller. I choose it because i feel it make more clean view controller. 
 * **Controller**: Contains **ArticleViewController** and **ArticelDetailViewController** component. Every controller is light weight controller. So they are extra files like **ArticleTableViewDataSource** and **ArticleDetailTableViewDataSource**  * **Helpers**: Contains files like constant and customcontrol that are essential and very helpful. 
 
 * **Interactor**: Contains **ArticleViewInteractor** and **ArticelDetailViewInteractor** files. Interactor is handling all business logic and it is also working with viewcontroller and worker to populate required information into viewcontrollers 
 * **Models**: Contains **BusinessModel** and **ViewModels** files. 
 * **Presentor**: Contains **ArticleViewPresentor** and **ArticelDetailViewPresentor** files. Presentor is handling all presntation logic of viewcontrollers
  * **Router**: Contains **ArticleAppRouter** which allow to navigate to detail screen. It is also communicating with interactor to send required info to detail interactor. 
  * **Storboard**: Contains **Main** storyboard and default **launchScreen**.
   
  * **WebApi**: WebiApi component is responsible for all network calls and cache of network calls. I have LRUCache which is using linklist as data structure
  * **Worker**: Worker is responsable for handling remote calling.

# How To run

To run the project just open .xcodeproj and click on the run button. No pre-configuration required to run the project

# Unit Testing and Coverage
To run unit test. Open .xcodeproj and click on Test navigator and press play button. For generating code coverage report we need to enable code coverage from edit scheme. Screen shot is attached for more clarification. 

<img width="500" alt="Screen Shot 2019-09-13 at 10 11 47 PM" src="https://user-images.githubusercontent.com/13622096/64884792-9b80bf80-d673-11e9-9161-9aed2f2871b0.png">

To see the code coverage we need to go to report navigator and click on coverage.

<img width="500" alt="Screen Shot 2019-09-14 at 2 40 45 PM" src="https://user-images.githubusercontent.com/13622096/64906960-ba2b9880-d6fd-11e9-90f8-e8c7a622ed29.png">




# Screenshots
<img width="300" alt="Screen Shot 2019-09-14 at 2 40 45 PM" src="https://user-images.githubusercontent.com/13622096/64883896-6ffcd580-d671-11e9-8209-e1e1ba6cfc38.png">
<img width="300" alt="Screen Shot 2019-09-14 at 2 40 45 PM" src="https://user-images.githubusercontent.com/13622096/64883940-899e1d00-d671-11e9-8a16-9b48478b5d31.png">



# AppFeature
  *Clean Architecture 
  *AutoLayout
  



