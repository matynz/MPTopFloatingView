task :release, [:name]  do |t, args|

  puts 'Checking repo'

  if not args.name
    $stderr.puts "[!] Pod name is required"
    exit 1
  end
  pod_name = args.name.to_s()

  pod_version = spec_version(pod_name)

  if tag_already_exists(pod_version)
    $stderr.puts "[!] A tag for version #{pod_version} already exists. Change the version in the podspec"
    exit 1
  end

  puts 'Repo check complete'

  puts "Creating tag #{pod_version}"

  create_tag(pod_version)
  push_tag

  puts 'Tag created'

  puts 'Publishing pod'
  
  push_pod(pod_name)   
 
  puts 'Done!'
end

def is_master_branch?
  `git symbolic-ref HEAD 2>/dev/null`.strip.split('/').last == 'master'
end

def has_untracked_changes?
  `git status --porcelain|wc -l`.to_s().strip! != "0"
end

def spec_version(pod_name)
  require 'cocoapods'
  
  spec = Pod::Specification.from_file("#{pod_name}.podspec")
  spec.version.to_s()
end

def tag_already_exists(pod_version)
  `git tag`.strip.split("\n").include?(pod_version)
end

def create_tag(pod_version)
  sh "git tag #{pod_version}"
end

def push_tag
  sh 'git push origin --tags'
end

def push_pod(pod_name)
  if not `pod repo list`.strip.split("\n").include?("private-repos")
    sh "pod repo add private-repos git@github.com:matynz/private-specs.git"
  end

  sh "pod repo push private-repos #{pod_name}.podspec --allow-warnings"
end
