\name{SurvGPR_Predict}
\alias{SurvGPR_Predict}
\title{Predict log-survival time with Gaussian process regression using an object of class \code{SurvGRP}.}
\usage{
SurvGPR_Predict(results, barT, Z.full, K.full, train.inds, test.inds, times, 
					kern.type=c("K+I", "multi-K"))
}
\arguments{
\item{results}{An object of class "SurvGPR" obtained from fitting a model using \code{SurvGPR.} }
\item{barT}{A vector of length \eqn{n_{\rm train}} to be used for prediction. This should contain the log-survival times of the training (and/or their imputed values). If the training data is that which we used to fit the ``result'' object, this should be the \code{Tout} object.}
\item{Z.full}{A matrix of dimension \eqn{(n_{\rm train} + n_{\rm test}) \times q} with the same covariates (arranged in the same order) as \eqn{Z} used to obtain ``results''.  Note that \eqn{n_{\rm train}} must be the dimension of \code{barT}.}
\item{K.full}{Kernel matrices corresponding to the first \eqn{M} variance components of \code{results$sigma2} -- an array of dimension \eqn{(n_{\rm train} + n_{\rm test}) \times (n_{\rm train} + n_{\rm test}) \times M}. }
\item{train.inds}{The indices of \code{Z.full} and \code{K.full} which correspond to the training data. Note that \code{barT} must be ordered so that its elements correspond to the train.inds.}
\item{test.inds}{The indices of \code{Z.full} and \code{K.full} which correspond to the test data, i.e., the data for which we want to make predictions.}
\item{times}{A vector of times (on the original scale) at which we want to evaluate a survival function for the testing data. }
\item{kern.type}{A character argument -- either \code{K+I} when \eqn{M=1} or \code{multi-K} when \eqn{M>1}. Incorrect compatability with input \eqn{K} will produce an error. }
}
\value{
	\item{test.inds}{The indices of \code{Z.full} and K.full which correspond to the test data, i.e., the data for which we made predictions.}
	\item{log.pred}{The predicted log-survival times for the testing subjects. }
	\item{survFunc}{An \eqn{n_{\rm test} \times {\rm length}(\texttt{times})} matrix containing the estimated survival curves. The \eqn{k}th row is the estimated survival curve for the \eqn{k}th subject in the testing data evaluated at the inputed times. }
}
\description{
	A function for prediction based on an object of class "SurvGRP"; models fit by \code{SurvGPR}. 
}
