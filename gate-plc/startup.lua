--
-- Stargate Programmable Logic Controller
--

require("/initenv").init_env()

local comms     = require("scada-common.comms")
local crash     = require("scada-common.crash")
local log       = require("scada-common.log")
local mqueue    = require("scada-common.mqueue")
local network   = require("scada-common.network")
local ppm       = require("scada-common.ppm")
local util      = require("scada-common.util")

local configure = require("gate-plc.configure")
local databus   = require("gate-plc.databus")
local plc       = require("gate-plc.plc")
local renderer  = require("gate-plc.renderer")
local threads   = require("gate-plc.threads")

local R_PLC_VERSION = "v0.0.1-ALPHA"

local println = util.println
local println_ts = util.println_ts
