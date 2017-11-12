# coding: utf-8

def bar():
    CMD_RUN = __salt__['cmd.run']
    cmd = "ifconfig"
    return CMD_RUN(cmd)
