node {
	def registryProject='registry.gitlab.com/snalogi/snalogi-tuto'
	def IMAGE="${registryProject}:version-${env.BUILD_ID}"

	stage('Clone'){
		checkout scm
	}

	def img = stage('Build'){
		docker.build("$IMAGE", '.')
	}

	stage('Run'){
		img.withRun('--name run-$BULD_ID -p 80:80'){
			c -> sh 'curl localhost'
		}
	}

	stage('Push'){
		docker.withRegistry('https://registry.gitlab.com', 'snalogi'){
			img.push 'latest'
			img.push()
		}
	}
}
