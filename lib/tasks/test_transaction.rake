# encoding:utf-8
# Pressimistic Lock 範例
# 必須仰賴資料庫支援(SQLite並沒有支援 Pessimistic Lock 機制)
# 此範例使用 PostgreSQL 設計

def job(name)
    puts name
    Book.transaction do
        puts 'start transaction!'
        row=Book.lock(true).first
        sleep 5
        if row.status == nil
            row.status = 0
        end
        if row.status==0
            puts 'this thread detect status = 0'
            row.status-=1
        else
            row.status+=1
            puts 'this thread detect status = 1'
        end
        row.save!
    end
end

namespace :test_transaction do
  desc "TODO"
  task run: :environment do
    job('t1')
  end
end
