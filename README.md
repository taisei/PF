# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# <参考書セレクト>
## サイト概要
地方の受験生が参考書選びで迷った時に共有したり意見したり参考にできるサイトです。

### サイトテーマ
受験生が悩まないようにしてあげたい。

### テーマを選んだ理由
自分自身が参考書選びでいっぱい時間を使ってしまったから。

### ターゲットユーザ
進学を考えている地方の受験生。

### 主な利用シーン
参考書選びで悩んでいる人々

## 設計書


### 機能一覧
https://docs.google.com/spreadsheets/d/19KJKduLrgZvVGZ5M7He7caythtQtV4BW1Um5-E08PGE/edit?usp=sharing
%= f.attachment_field :image,size: "190x150" %>
<%= image_tag('sample-author1.jpg', style: "width: 60px; height: 60px;") %>
def create
    post_image = PostImage.find(params[:post_image_id])
    favorite = current_user.favorites.new(post_image_id: post_image.id)
    favorite.save
    redirect_to post_image_path(post_image)
  end
  <li><%= link_to "mypage", edit_user_path(@user), class: "glyphicon glyphicon-user" %></li>