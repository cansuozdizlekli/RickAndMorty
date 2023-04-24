# Invıo Task - Rick And Morty App

## 1. Summary
This app shows the characters with their details which are living in some specific locations using [Rick and Morty API](https://rickandmortyapi.com/) .
<br><br>
<img width="232" alt="Ekran Resmi 2023-04-24 ÖS 8 06 43" src="https://user-images.githubusercontent.com/101900120/234067135-c751e3a8-069f-41b9-bcd3-9aaddacfb2c1.png">
<img width="250" alt="Ekran Resmi 2023-04-24 ÖS 7 43 25" src="https://user-images.githubusercontent.com/101900120/234067152-93f8d6f9-a7e7-480e-85c2-5ccb84bf2c7e.png">
<img width="253" alt="Ekran Resmi 2023-04-24 ÖS 7 44 37" src="https://user-images.githubusercontent.com/101900120/234067158-f13e10cf-149b-43c5-b5c6-da6733018bce.png">


## 2. Usage
First, a splash screen welcomes to user and after that, locations are loaded to the screen which are selectable. 
Initially, first location is selected from the locations list.
After loading the characters based on locations, a specific character can be selected and the user is redirected to detail screen which includes:
1. Status
2. Specy
3. Gender
4. Origin
5. Location
6. Episode
7. Created at

fields with related character's image.

## 3. Endpoints Base Urls
Base URL: https://rickandmortyapi.com/api

`{baseURL}/location`&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Loads the locations to the top

`{baseURL}/character/{id}`&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Loads a single character, with its details

`{baseURL}/character/{id1},{id2}`&nbsp;&nbsp;&nbsp;&nbsp;Loads more than 2 characters

## 4. Third Party Libraries

* Alamofire
* SDWebImage

## 5. Design Pattern
This project uses MVVM approach to make the UI and data sources to communicate.

## 6. Folder Structure 

```
   System                  includes core files
   Model                   includes swift structs of backend models
   ViewModel               includes view model which establish communication between data and UI
   Controllers             includes screens and their view controllers
   Helper                  includes some extensions
   Services                includes general API url
   Manager                 includes classes that is used for establishing backend connection
   ```
 



