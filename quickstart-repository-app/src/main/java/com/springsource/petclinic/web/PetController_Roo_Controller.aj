// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.petclinic.web;

import com.springsource.petclinic.domain.Pet;
import com.springsource.petclinic.reference.PetType;
import com.springsource.petclinic.service.OwnerService;
import com.springsource.petclinic.service.PetService;
import com.springsource.petclinic.service.VisitService;
import com.springsource.petclinic.web.PetController;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect PetController_Roo_Controller {
    
    @Autowired
    PetService PetController.petService;
    
    @Autowired
    OwnerService PetController.ownerService;
    
    @Autowired
    VisitService PetController.visitService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String PetController.create(@Valid Pet pet, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, pet);
            return "pets/create";
        }
        uiModel.asMap().clear();
        petService.savePet(pet);
        return "redirect:/pets/" + encodeUrlPathSegment(pet.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String PetController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Pet());
        return "pets/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String PetController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("pet", petService.findPet(id));
        uiModel.addAttribute("itemId", id);
        return "pets/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String PetController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("pets", petService.findPetEntries(firstResult, sizeNo));
            float nrOfPages = (float) petService.countAllPets() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("pets", petService.findAllPets());
        }
        return "pets/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String PetController.update(@Valid Pet pet, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, pet);
            return "pets/update";
        }
        uiModel.asMap().clear();
        petService.updatePet(pet);
        return "redirect:/pets/" + encodeUrlPathSegment(pet.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String PetController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, petService.findPet(id));
        return "pets/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String PetController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Pet pet = petService.findPet(id);
        petService.deletePet(pet);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/pets";
    }
    
    void PetController.populateEditForm(Model uiModel, Pet pet) {
        uiModel.addAttribute("pet", pet);
        uiModel.addAttribute("owners", ownerService.findAllOwners());
        uiModel.addAttribute("visits", visitService.findAllVisits());
        uiModel.addAttribute("pettypes", Arrays.asList(PetType.values()));
    }
    
    String PetController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
