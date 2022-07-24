rule win_satan_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.satan."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.satan"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { 83c40c c745880f000000 c7458400000000 c68574ffffff00 8d8d70ffffff }
            // n = 5, score = 100
            //   83c40c               | add                 esp, 0xc
            //   c745880f000000       | mov                 dword ptr [ebp - 0x78], 0xf
            //   c7458400000000       | mov                 dword ptr [ebp - 0x7c], 0
            //   c68574ffffff00       | mov                 byte ptr [ebp - 0x8c], 0
            //   8d8d70ffffff         | lea                 ecx, [ebp - 0x90]

        $sequence_1 = { c68594feffff00 8d8d90feffff c645fc12 e8???????? 8d8d90feffff e8???????? 83bd78ffffff10 }
            // n = 7, score = 100
            //   c68594feffff00       | mov                 byte ptr [ebp - 0x16c], 0
            //   8d8d90feffff         | lea                 ecx, [ebp - 0x170]
            //   c645fc12             | mov                 byte ptr [ebp - 4], 0x12
            //   e8????????           |                     
            //   8d8d90feffff         | lea                 ecx, [ebp - 0x170]
            //   e8????????           |                     
            //   83bd78ffffff10       | cmp                 dword ptr [ebp - 0x88], 0x10

        $sequence_2 = { 7317 6892060000 68???????? 68???????? e8???????? 83c40c 837dec10 }
            // n = 7, score = 100
            //   7317                 | jae                 0x19
            //   6892060000           | push                0x692
            //   68????????           |                     
            //   68????????           |                     
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   837dec10             | cmp                 dword ptr [ebp - 0x14], 0x10

        $sequence_3 = { 83e03f 6bc830 8b149540e04700 8a440a29 8845a7 807da702 740a }
            // n = 7, score = 100
            //   83e03f               | and                 eax, 0x3f
            //   6bc830               | imul                ecx, eax, 0x30
            //   8b149540e04700       | mov                 edx, dword ptr [edx*4 + 0x47e040]
            //   8a440a29             | mov                 al, byte ptr [edx + ecx + 0x29]
            //   8845a7               | mov                 byte ptr [ebp - 0x59], al
            //   807da702             | cmp                 byte ptr [ebp - 0x59], 2
            //   740a                 | je                  0xc

        $sequence_4 = { e8???????? 8d8df0feffff e8???????? 8b85ecfeffff 83f810 7212 40 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8d8df0feffff         | lea                 ecx, [ebp - 0x110]
            //   e8????????           |                     
            //   8b85ecfeffff         | mov                 eax, dword ptr [ebp - 0x114]
            //   83f810               | cmp                 eax, 0x10
            //   7212                 | jb                  0x14
            //   40                   | inc                 eax

        $sequence_5 = { eb03 83c004 50 8bd6 8d8d60ffffff e8???????? 8b85acfeffff }
            // n = 7, score = 100
            //   eb03                 | jmp                 5
            //   83c004               | add                 eax, 4
            //   50                   | push                eax
            //   8bd6                 | mov                 edx, esi
            //   8d8d60ffffff         | lea                 ecx, [ebp - 0xa0]
            //   e8????????           |                     
            //   8b85acfeffff         | mov                 eax, dword ptr [ebp - 0x154]

        $sequence_6 = { 8b85c4feffff 8d8dc4feffff 56 8b4004 03c8 8b510c 83ca02 }
            // n = 7, score = 100
            //   8b85c4feffff         | mov                 eax, dword ptr [ebp - 0x13c]
            //   8d8dc4feffff         | lea                 ecx, [ebp - 0x13c]
            //   56                   | push                esi
            //   8b4004               | mov                 eax, dword ptr [eax + 4]
            //   03c8                 | add                 ecx, eax
            //   8b510c               | mov                 edx, dword ptr [ecx + 0xc]
            //   83ca02               | or                  edx, 2

        $sequence_7 = { 85c9 7426 8b55fc 0fbe02 83f841 }
            // n = 5, score = 100
            //   85c9                 | test                ecx, ecx
            //   7426                 | je                  0x28
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   0fbe02               | movsx               eax, byte ptr [edx]
            //   83f841               | cmp                 eax, 0x41

        $sequence_8 = { e8???????? 8b4528 8d4dd4 8945dc e8???????? 83ec0c 8d5dec }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8b4528               | mov                 eax, dword ptr [ebp + 0x28]
            //   8d4dd4               | lea                 ecx, [ebp - 0x2c]
            //   8945dc               | mov                 dword ptr [ebp - 0x24], eax
            //   e8????????           |                     
            //   83ec0c               | sub                 esp, 0xc
            //   8d5dec               | lea                 ebx, [ebp - 0x14]

        $sequence_9 = { 23d0 7411 8b4dd8 c60100 }
            // n = 4, score = 100
            //   23d0                 | and                 edx, eax
            //   7411                 | je                  0x13
            //   8b4dd8               | mov                 ecx, dword ptr [ebp - 0x28]
            //   c60100               | mov                 byte ptr [ecx], 0

    condition:
        7 of them and filesize < 1163264
}