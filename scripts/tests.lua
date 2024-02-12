local lu = require('luaunit')

-- Set so that tests don't exit
fullTestSuite = true

require('tests.util.MathUtilTest')
require('tests.util.RandomNumberTest')
require('tests.machinelearning.ai.NeatTest')
require('tests.machinelearning.ai.NetworkTest')
require('tests.machinelearning.ai.PoolTest')
require('tests.display.DisplayTest')

os.exit(lu.LuaUnit.run())