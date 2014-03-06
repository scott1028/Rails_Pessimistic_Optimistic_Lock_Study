# encoding:utf-8

# 這個 Model 存在 lock_version 欄位(參考: 20140306153202_create_optimistic_locks.rb)
# 所以支援 Optimistic Lock
# 參考：http://api.rubyonrails.org/classes/ActiveRecord/Locking/Optimistic.html

class OptimisticLock < ActiveRecord::Base
end
