
<!--//////  Desktop and tablet view  //////-->
<div class="container" id="user-profile" ng-if="!ctrl.isMobile">
    <div class="user-info">
        <div class="user-profile-photo">
            <img ng-src="/webapp/{{ctrl.userInfo.userReference.userProfilePhotoDownloadLink ? 'fileOperation/download/public/'+ ctrl.userInfo.userReference.userProfilePhotoDownloadLink : ctrl.defaultProfile }}">
        </div>
        <div class="user-profile-name">
            <b>{{ctrl.userInfo.userReference.userName}}</b>
        </div>
        <div class="user-profile-follow">
            <div class="private-follow" ng-if="ctrl.isPrivate">
                Following: <a ng-href=""><u>{{ctrl.following}}</u></a> &nbsp;&nbsp; | &nbsp;&nbsp; Follower: <a ng-href=""><u>{{ctrl.follower}}</u></a> 
            </div>
            <div class="public-follow" ng-if="!ctrl.isPrivate">
                <button type="button" class="follow-btn ic-btn" ng-click="ctrl.changeFollow()">
                    {{ctrl.followBtn}}
                </button>
                <div class="divider"></div>
                <button type="button" class="post-btn ic-btn">CONTACT</button>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3 user-left">
            <div class="ud-edit">
                <a ng-href="" ng-if="ctrl.isPrivate">Edit</a>
            </div>
            <div class="ud-biograpghy"> 
                <b>Biography:</b><br><br>
                {{ctrl.userInfo.userBio}}
            </div>
            <div class="ud-social-media">
                <b>Social Medias:</b><br><br>
                <a href="#" class="fa fa-facebook"></a>
                <a href="#" class="fa fa-twitter"></a>
                <a href="#" class="fa fa-pinterest"></a>
                <a href="#" class="fa fa-linkedin"></a>
            </div>
            <div class="ud-interests">
                <b>Interests:</b><br><br>
                <div ng-repeat="(interest, isSelected) in ctrl.userInfo.userGeneralInterest">
                    <span ng-if="isSelected"> {{interest}} </span>
                </div>
            </div>
        </div>
        <div class="col-md-1"></div>
        <div class="col-md-8 user-right">
            <div class="row user-post" ng-if="ctrl.isPrivate">
                <textarea class="form-control post-content" rows="4" ng-model="ctrl.postingTxt"></textarea>
                <button type="button" class="post-btn ic-btn">POST</button>
            </div>
            <div class="row user-posted-list">
                <div class="user-posted user-empty-posted" ng-if="!ctrl.userInfo.postModels.length"> 
                    No Posts Yet
                </div>
                <div class="user-posted" ng-repeat = "postModel in ctrl.userInfo.postModels">
                    <span>{{postModel.postTime | amDateFormat:'MM/DD/YY-HH:mm'}}</span>
                    <span ng-if="ctrl.isPrivate" class="glyphicon glyphicon-trash" aria-hidden="true" ng-click="ctrl.deletePost()"></span>
                    <br><br>
                    <span>{{postModel.post}}<br></span>
                </div>
            </div>
        </div>
    </div>
</div>

<!--//////  Mobile view  //////-->
<div class="container" id="user-profile-mobile" ng-if="ctrl.isMobile">
    <div class="user-info">
        <div class="user-edit">
            <a ng-href="">
                <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                Edit your profile 
            </a>
        </div>
        <div class="user-profile-photo">
            <img ng-src="/webapp/{{ctrl.userInfo.userReference.userProfilePhotoDownloadLink ? 'fileOperation/download/public/'+ ctrl.userInfo.userReference.userProfilePhotoDownloadLink : ctrl.defaultProfile }}">
        </div>
        <div class="user-profile-name">
            <b>{{ctrl.userInfo.userReference.userName}}</b>
        </div>
        <div class="user-profile-follow">
            <div class="private-follow" ng-if="ctrl.isPrivate">
                Following: <a ng-href=""><u>{{ctrl.following}}</u></a> &nbsp;&nbsp; | &nbsp;&nbsp; Follower: <a ng-href=""><u>{{ctrl.follower}}</u></a> 
            </div>
            <div class="public-follow" ng-if="!ctrl.isPrivate">
                <button type="button" class="follow-btn ic-btn" ng-click="ctrl.changeFollow()">
                    {{ctrl.followBtn}}
                </button>
                <div class="divider"></div>
                <button type="button" class="post-btn ic-btn">CONTACT</button>
            </div>
        </div>
    </div>
    <div class="row user-post"  ng-if="ctrl.isPrivate">
        <textarea class="form-control post-content" rows="4" ng-model="ctrl.postingTxt"></textarea>
        <button type="button" class="post-btn ic-btn">POST</button>
    </div>
    <div class="user-left">
        <div class="ud-biograpghy"> 
            <b>Biography:</b><br><br>
            {{ctrl.userInfo.userBio}}
        </div>
        <div class="ud-social-media">
            <b>Social Medias:</b><br><br>
            <a href="#" class="fa fa-facebook"></a>
            <a href="#" class="fa fa-twitter"></a>
            <a href="#" class="fa fa-pinterest"></a>
            <a href="#" class="fa fa-linkedin"></a>
        </div>
        <div class="ud-interests">
            <b>Interests:</b><br><br>
             <div ng-repeat="(interest, isSelected) in ctrl.userInfo.userGeneralInterest">
                <span ng-if="isSelected"> {{interest}} </span>
            </div>
        </div>
    </div>
    <div class="row user-posted-list">
        <div class="user-posted user-empty-posted" ng-if="!ctrl.userInfo.postModels.length"> 
            No Posts Yet
        </div>
        <div class="user-posted" ng-repeat = "postModel in ctrl.userInfo.postModels">
            <span>{{postModel.postTime | amDateFormat:'MM/DD/YY-HH:mm'}}</span>
            <span ng-if="ctrl.isPrivate" class="glyphicon glyphicon-trash" aria-hidden="true" ng-click="ctrl.deletePost()"></span>
            <br><br>
            <span>{{postModel.post}}<br></span>
        </div>
    </div>
</div>
