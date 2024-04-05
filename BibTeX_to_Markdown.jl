"""
    format_bibtex(BibTeX::String)
    
Take in a BibTeX article entry as formatted on Google Scholar and format it to look nice in Markdown.
    Inputs: 
        BibTeX (::String): A BibTeX entry in standard format e.g., what one may find in Google Scholar
    Outputs: 
        markdown (::String): The corresponding BibTeX entry formatted to look nice in Markdown. 
"""
function format_bibtex(BibTeX::String)
    fields = match(r"@article\{(.*?)\n\s*(.*?)\n\s*(.*?)\n\s*(.*?)\n\s*(.*?)\n\s*(.*?)\n\s*(.*?)\n\s*(.*?)\n\s*(.*?)\n\s*}", BibTeX)
    if fields === nothing
        return "Invalid input format"
    end

    # Constructing the output string
    markdown = "@article{" * fields[1] * "<br>\n"
    for i in 2:length(fields)
        markdown *= "&nbsp;&nbsp;&nbsp; " * fields[i] * "<br>\n"
    end

    markdown *= "}"
    return markdown
end
