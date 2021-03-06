% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/EWMA.R
\name{plot.EWMA}
\alias{plot.EWMA}
\title{Plot EWMA Model Estimates}
\usage{
\method{plot}{EWMA}(x, y = NULL, ..., assets = c(1, 2), legendLoc = NULL,
  main = "EWMA Estimate", legendCex = 0.8)
}
\arguments{
\item{x}{an EWMA object created via \code{\link{EWMA}}.}

\item{y}{not used.}

\item{assets}{character vector or numeric vector of assets to extract from
the covariance or correlation matrix. The assets can be specified by name or
index. This argument is only usd for multivariate EWMA estimates of
a covariance or correlation matrix.}

\item{legendLoc}{location of legend. If NULL, the legend will be omitted
from the plot.}

\item{main}{main title for the plot.}

\item{legendCex}{numerical value giving the amount by which the legend.}

\item{\dots}{passthrough parameters to \code{plot.xts}.}
}
\description{
Plot method for EWMA objects.
}
\examples{
# data and parameters for EWMA estimate
data(crsp_weekly)
R <- largecap_weekly[, 1:2]
mvR <- largecap_weekly[,1:4]
lambda <- 0.94
initialWindow <- 150

# volatility estimate of univariate data
vol1 <- EWMA(R[,1], lambda, initialWindow, type="volatility")
plot(vol1)

# covariance estimate of bivariate data
cov1 <- EWMA(R, lambda, initialWindow, type="covariance")
plot(cov1)

# correlation estimate of bivariate data
cor1 <- EWMA(R, lambda, initialWindow, type="correlation")
plot(cor1)

# Multivariate EWMA estimate of covariance
cov_mv <- EWMA(mvR, lambda, initialWindow, type="covariance")
# These two are equivalent
plot(cov_mv, assets=c("ORCL", "MSFT"))
plot(cov_mv, assets=c(1, 2))

# Multivariate EWMA estimate of correlation
cor_mv <- EWMA(mvR, lambda, initialWindow, type="correlation")
# These two are equivalent
plot(cor_mv, assets=c("ORCL", "EMC"))
plot(cor_mv, assets=c(1, 4))
}
\author{
Ross Bennett
}

