module RedisStore
  def hget(hash, field)
    redis.hget(hash, field)
  end

  def hmget(hash, *fields)
    redis.hmget(hash, *fields)
  end

  def hgetall(hash)
    redis.hgetall(hash)
  end

  def hmset(hash, *field_value)
    redis.hmset(hash, *field_value)
  end

  def expire(hash, time)
    redis.expire(hash, time)
  end

  private
  def redis
    $redis
  end
end
