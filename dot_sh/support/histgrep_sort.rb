# frozen_string_literal: true

require 'time'

DATE_PATTERN = /\d{4}(-?)\d{2}\1\d{2}/
TIME_PATTERN = /\d{2}(\.?)\d{2}\1\d{2}(?:\.\d+)?(?:\+\d{3}|Z)?/
FILENAME_PATTERN = /#{DATE_PATTERN}(?:T#{TIME_PATTERN})?/

lines = STDIN.read.each_line
sorted = lines.sort_by do |line|
  iso = line.match(FILENAME_PATTERN)
    .to_s
    .sub(/(T\d{2})\.(\d{2})\.(\d{2})/, '\1:\2:\3')
  if iso.empty? || iso =~ /^0000/ then Time.new(1900)
  else Time.parse(iso)
  end
end

puts sorted
