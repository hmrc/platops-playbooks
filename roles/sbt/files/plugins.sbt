resolvers += Resolver.bintrayIvyRepo("hmrc", "sbt-plugin-releases")
resolvers += Resolver.bintrayRepo("hmrc", "releases")
 
addSbtPlugin("com.github.gseitz" % "sbt-release" % "0.8.3")
 
addSbtPlugin("com.typesafe.play" % "sbt-plugin" % "2.5.19")
 
addSbtPlugin("uk.gov.hmrc" % "sbt-auto-build" % "1.13.0")
 
addSbtPlugin("uk.gov.hmrc" % "sbt-artifactory" % "0.17.0")
 
addSbtPlugin("uk.gov.hmrc" % "sbt-git-versioning" % "1.15.0")
 
addSbtPlugin("uk.gov.hmrc" % "sbt-distributables" % "1.2.0")

addSbtPlugin("uk.gov.hmrc" % "sbt-bobby" % "0.34.0")

addSbtPlugin("com.timushev.sbt" % "sbt-updates" % "0.3.4")
