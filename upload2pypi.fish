#! /usr/bin/fish
function upload2pypi
    python3 -m venv upload2pypivenv

    . upload2pypivenv/bin/activate.fish

    pip install twine wheel

    python3 setup.py sdist bdist_wheel

    set distcount (count (ls dist/ ))
    if math "$distcount == 2" > /dev/null
        twine upload dist/*
    else
        echo "Wrong number of file in dist. Please delete all unnecessary files"
    end

    deactivate

    rm -rf upload2pypivenv
end
