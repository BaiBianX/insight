# frozen_string_literal: true

$redis = Redis::Namespace.new('insight', redis: Redis.new)
