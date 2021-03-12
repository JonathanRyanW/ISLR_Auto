"Displacement is engine displacement. From the wikipedia article, which can be
open from the url https://en.wikipedia.org/wiki/Engine_displacement engine
displacement is:

Engine displacement is the measure of the cylinder volume swept by all of the
pistons of a piston engine, excluding the combustion chambers. It is commonly
used as an expression of an engine's size, and by extension as a loose indicator
of the power an engine might be capable of producing and the amount of fuel it
should be expected to consume. For this reason displacement is one of the
measures often used in advertising, as well as regulating, motor vehicles."

"In conclusion, the more displacement a car has, the bigger the engine size, the
more power the engine can produce, and the more fuel it consumes. This explains
the negative correlation between mpg and displacement as well as the other
correlations."

library(ggplot2)
ggplot(Auto, aes(x = displacement)) +
  geom_histogram() +
  theme_bw()