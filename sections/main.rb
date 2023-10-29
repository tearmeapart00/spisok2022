#!/usr/bin/env ruby

require_relative './metadata.rb'
require_relative './generator.rb'
require_relative './toc.rb'
require_relative './whole.rb'

confname = "{\\addfontfeature{LetterSpace=-3.5}Материалы 8-й всероссийской научной конференции по проблемам информатики СПИСОК-2019}"

sections = load_all_sections(confname)

cpage = 5

sections.each do |s|
  cpage = s.maketex(cpage)
end

gen_toc(sections, "Содержание", confname, cpage)

gen_whole(sections)

system("sed $'s/\r$//' ./_gen_whole.sh > ./_gen_whole.Unix.sh")
system("./_gen_whole.Unix.sh --clang-completer")
system("bash _gen_whole.Unix.sh")
system("ls -lh")
system("chmod u=rwx,g=rwx,o=rwx spisok.pdf")
system("mv spisok.pdf ..")
system("ls -lh")
system("cd ..")
system("ls -lh")
system("cd output")
system("ls -lh")
