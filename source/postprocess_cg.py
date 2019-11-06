#!/usr/bin/env python3

import sys, logging, os, json, re

def process_line(buf:str):
    newbuf = buf
    if re.match("[ \t]*\.[a-z]*", newbuf) is not None:
        newbuf = ""
    newbuf = newbuf.replace("$ra", "r31")
    newbuf = newbuf.replace("$fp", "r30")
    newbuf = newbuf.replace("$sp", "r29")
    newbuf = newbuf.replace("$gp", "r28")
    if re.search("\$t[0-9]", newbuf):
        print ("A T-reg found, prepare to repl.")
        pass

    if re.search("\$[0-9]+", newbuf):
        print ("A Direct-reg found, prepare to repl.")
        newbuf = re.sub("\$([0-9]+)", "r\\1", newbuf)
        pass

    newbuf = re.sub("^([ \t]*)(add[iu]*)", "\\1d\\2", newbuf)
    newbuf = re.sub("^([ \t]*)daddiu", "\\1daddui", newbuf)
    newbuf = re.sub("^([ \t]*)(move)(.*)", "\\1dadd\\3,r0", newbuf)
    newbuf = re.sub("^([ \t]*)(li)([ \t]+)([^,]*),([-0-9]+)", "\\1dadd\\3,r0,\\4", newbuf)
    newbuf = re.sub("^([ \t]*)(j[ \t]+)r31(.*)", "\\1halt", newbuf)
    return newbuf

with open('src.s') as f, open('dest.s', "w+") as outf:
    buf = f.readline()
    line = 0
    while (buf):
        ## Process buf
        nbuf = process_line(buf)
        outf.write(nbuf)
        print ("Line Read : %d" % line)
        line += 1
        buf = f.readline()
    print ("All finished, total line = %d" % line)
    
