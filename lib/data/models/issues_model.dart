class IssuesModel {
  IssuesModel({
      this.url, 
      this.repositoryUrl, 
      this.labelsUrl, 
      this.commentsUrl, 
      this.eventsUrl, 
      this.htmlUrl, 
      this.id, 
      this.nodeId, 
      this.number, 
      this.title, 
      this.user, 
      this.labels, 
      this.state, 
      this.locked,
      this.milestone, 
      this.comments, 
      this.createdAt, 
      this.updatedAt, 
      this.closedAt, 
      this.authorAssociation, 
      this.activeLockReason, 
      this.draft,
      this.body,
      this.timelineUrl, 
      this.performedViaGithubApp, 
      this.stateReason,});

  IssuesModel.fromJson(dynamic json) {
    url = json['url'];
    repositoryUrl = json['repository_url'];
    labelsUrl = json['labels_url'];
    commentsUrl = json['comments_url'];
    eventsUrl = json['events_url'];
    htmlUrl = json['html_url'];
    id = json['id'];
    nodeId = json['node_id'];
    number = json['number'];
    title = json['title'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['labels'] != null) {
      labels = [];
      json['labels'].forEach((v) {
        labels?.add(Labels.fromJson(v));
      });
    }
    state = json['state'];
    locked = json['locked'];
    milestone = json['milestone'];
    comments = json['comments'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    closedAt = json['closed_at'];
    authorAssociation = json['author_association'];
    activeLockReason = json['active_lock_reason'];
    draft = json['draft'];
    body = json['body'];
    timelineUrl = json['timeline_url'];
    performedViaGithubApp = json['performed_via_github_app'];
    stateReason = json['state_reason'];
  }
  String? url;
  String? repositoryUrl;
  String? labelsUrl;
  String? commentsUrl;
  String? eventsUrl;
  String? htmlUrl;
  num? id;
  String? nodeId;
  num? number;
  String? title;
  User? user;
  List<Labels>? labels;
  String? state;
  bool? locked;
  dynamic milestone;
  num? comments;
  String? createdAt;
  String? updatedAt;
  dynamic closedAt;
  String? authorAssociation;
  dynamic activeLockReason;
  bool? draft;
  String? body;
  String? timelineUrl;
  dynamic performedViaGithubApp;
  dynamic stateReason;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['repository_url'] = repositoryUrl;
    map['labels_url'] = labelsUrl;
    map['comments_url'] = commentsUrl;
    map['events_url'] = eventsUrl;
    map['html_url'] = htmlUrl;
    map['id'] = id;
    map['node_id'] = nodeId;
    map['number'] = number;
    map['title'] = title;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (labels != null) {
      map['labels'] = labels?.map((v) => v.toJson()).toList();
    }
    map['state'] = state;
    map['locked'] = locked;
    map['milestone'] = milestone;
    map['comments'] = comments;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['closed_at'] = closedAt;
    map['author_association'] = authorAssociation;
    map['active_lock_reason'] = activeLockReason;
    map['draft'] = draft;
    map['body'] = body;
    map['timeline_url'] = timelineUrl;
    map['performed_via_github_app'] = performedViaGithubApp;
    map['state_reason'] = stateReason;
    return map;
  }

}

class Labels {
  Labels({
      this.id, 
      this.nodeId, 
      this.url, 
      this.name, 
      this.color,
      this.description,});

  Labels.fromJson(dynamic json) {
    id = json['id'];
    nodeId = json['node_id'];
    url = json['url'];
    name = json['name'];
    color = json['color'];
    description = json['description'];
  }
  num? id;
  String? nodeId;
  String? url;
  String? name;
  String? color;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['node_id'] = nodeId;
    map['url'] = url;
    map['name'] = name;
    map['color'] = color;
    map['description'] = description;
    return map;
  }

}

class User {
  User({
      this.login, 
      this.id, 
      this.nodeId, 
      this.avatarUrl, 
      this.gravatarId, 
      this.url, 
      this.htmlUrl, 
      this.followersUrl, 
      this.followingUrl, 
      this.gistsUrl, 
      this.starredUrl, 
      this.subscriptionsUrl, 
      this.organizationsUrl, 
      this.reposUrl, 
      this.eventsUrl, 
      this.receivedEventsUrl, 
      this.type, 
      this.siteAdmin,});

  User.fromJson(dynamic json) {
    login = json['login'];
    id = json['id'];
    nodeId = json['node_id'];
    avatarUrl = json['avatar_url'];
    gravatarId = json['gravatar_id'];
    url = json['url'];
    htmlUrl = json['html_url'];
    followersUrl = json['followers_url'];
    followingUrl = json['following_url'];
    gistsUrl = json['gists_url'];
    starredUrl = json['starred_url'];
    subscriptionsUrl = json['subscriptions_url'];
    organizationsUrl = json['organizations_url'];
    reposUrl = json['repos_url'];
    eventsUrl = json['events_url'];
    receivedEventsUrl = json['received_events_url'];
    type = json['type'];
    siteAdmin = json['site_admin'];
  }
  String? login;
  num? id;
  String? nodeId;
  String? avatarUrl;
  String? gravatarId;
  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;
  String? subscriptionsUrl;
  String? organizationsUrl;
  String? reposUrl;
  String? eventsUrl;
  String? receivedEventsUrl;
  String? type;
  bool? siteAdmin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['login'] = login;
    map['id'] = id;
    map['node_id'] = nodeId;
    map['avatar_url'] = avatarUrl;
    map['gravatar_id'] = gravatarId;
    map['url'] = url;
    map['html_url'] = htmlUrl;
    map['followers_url'] = followersUrl;
    map['following_url'] = followingUrl;
    map['gists_url'] = gistsUrl;
    map['starred_url'] = starredUrl;
    map['subscriptions_url'] = subscriptionsUrl;
    map['organizations_url'] = organizationsUrl;
    map['repos_url'] = reposUrl;
    map['events_url'] = eventsUrl;
    map['received_events_url'] = receivedEventsUrl;
    map['type'] = type;
    map['site_admin'] = siteAdmin;
    return map;
  }

}